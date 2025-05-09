import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/usecase/no_parameters.dart';
import 'refresh_token.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/authentication_repository.dart';

class AutoLogin implements UseCase<bool, NoParameters> {
  AutoLogin({
    required this.authenticationReposiroty,
    required this.dio,
    required this.refreshToken,
  });
  final AuthenticationReposiroty authenticationReposiroty;
  final Dio dio;
  final RefreshToken refreshToken;

  @override
  Future<Either<Failure, bool>> call(NoParameters noParameters) async {
    authenticationReposiroty.isAuthenticated().fold(
      (l) => null,
      (r) async {
        final token = await authenticationReposiroty.autoLogin();
        token.fold(
          (l) => null,
          (r) {
            dio.interceptors.add(
              QueuedInterceptorsWrapper(
                onRequest: (options, handler) {
                  authenticationReposiroty.isAuthenticated().fold(
                    (left) => {},
                    (right) {
                      options.headers['Authorization'] = 'Bearer ${r.token}';
                    },
                  );
                  return handler.next(options);
                },
                onResponse: (e, handler) {
                  if (e.statusCode == 401) {
                    refreshToken(NoParameters());
                  }
                  return handler.next(e);
                },
              ),
            );
          },
        );
      },
    );
    return const Right(true);
  }
}
