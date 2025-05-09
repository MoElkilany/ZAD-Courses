import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/usecase/no_parameters.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/authentication_repository.dart';

class Logout implements UseCase<void, NoParameters> {
  Logout({
    required this.authenticationReposiroty,
    required this.dio,
  });
  final AuthenticationReposiroty authenticationReposiroty;
  final Dio dio;

  @override
  Future<Either<Failure, void>> call(_) async {
    final logoutResponse = await authenticationReposiroty.logout();
    logoutResponse.fold(
      (l) => null,
      (r) {
        dio.interceptors.clear();
      },
    );
    return logoutResponse;
  }
}
