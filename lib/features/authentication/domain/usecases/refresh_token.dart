import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/authentication_repository.dart';

class RefreshToken implements UseCase<void, NoParameters> {
  RefreshToken({
    required this.authenticationReposiroty,
    required this.dio,
  });
  final AuthenticationReposiroty authenticationReposiroty;
  final Dio dio;

  @override
  Future<Either<Failure, void>> call(_) async {
    final loginResponse = await authenticationReposiroty.refreshToken();
    loginResponse.fold(
      (l) => null,
      (r) {
        dio.interceptors.clear();
        dio.interceptors.add(QueuedInterceptorsWrapper(
          onRequest: (options, handler) {
            authenticationReposiroty.isAuthenticated().fold(
              (left) => {},
              (right) {
                options.headers['Authorization'] = 'Bearer ${r.token}';
              },
            );
            return handler.next(options);
          },
        ));
      },
    );
    return loginResponse;
  }
}
