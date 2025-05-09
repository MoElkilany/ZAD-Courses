import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/register/register_request.dart';
import '../entities/register/register_response.dart';
import '../repositories/authentication_repository.dart';

class Register implements UseCase<RegisterResponse, RegisterRequest> {
  Register({
    required this.authenticationReposiroty,
  });
  final AuthenticationReposiroty authenticationReposiroty;

  @override
  Future<Either<Failure, RegisterResponse>> call(
    RegisterRequest registerRequest,
  ) async {
    final registerResponse = await authenticationReposiroty.register(registerRequest);

    return registerResponse;
  }
}
