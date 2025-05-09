import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/login/login_request.dart';
import '../entities/login/login_response.dart';
import '../entities/login/refresh_token_response.dart';
import '../entities/register/register_request.dart';
import '../entities/register/register_response.dart';
import '../entities/verification/verification_request.dart';
import '../entities/verification/verification_response.dart';

abstract class AuthenticationReposiroty {
  Future<Either<Failure, LoginResponse>> autoLogin();
  Future<Either<Failure, LoginResponse>> login(
    LoginRequest loginRequest,
  );
  Future<Either<Failure, RegisterResponse>> register(
    RegisterRequest registerRequest,
  );
  Future<Either<Failure, VerificationResponse>> verifyEmail(
    VerificationRequest verificationRequest,
  );
  Future<Either<Failure, void>> logout();
  Either<Failure, bool> isAuthenticated();
  Future<Either<Failure, RefreshTokenResponse>> refreshToken();
}
