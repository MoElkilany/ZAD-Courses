import 'package:dartz/dartz.dart';
import '../entities/verification/verification_request.dart';
import '../entities/verification/verification_response.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/authentication_repository.dart';

class VerifyEmail
    implements UseCase<VerificationResponse, VerificationRequest> {
  VerifyEmail({
    required this.authenticationReposiroty,
  });
  final AuthenticationReposiroty authenticationReposiroty;

  @override
  Future<Either<Failure, VerificationResponse>> call(
    VerificationRequest verificationRequest,
  ) async {
    final verificationResponse =
        await authenticationReposiroty.verifyEmail(verificationRequest);
    return verificationResponse;
  }
}
