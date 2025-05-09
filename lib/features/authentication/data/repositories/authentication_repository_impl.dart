import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/login/login_request.dart';
import '../../domain/entities/login/login_response.dart';
import '../../domain/entities/login/refresh_token_response.dart';
import '../../domain/entities/register/register_request.dart';
import '../../domain/entities/register/register_response.dart';
import '../../domain/entities/verification/verification_request.dart';
import '../../domain/entities/verification/verification_response.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../data_sources/authentication_local_data_source.dart';
import '../data_sources/authentication_remote_data_source.dart';
import '../models/login/hive/login_response_model.dart';

class AuthenticationReposirotyImpl implements AuthenticationReposiroty {
  final AuthenticationLocalDataSource authenticationLocalDataSource;
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;
  final NetworkInfo networkInfo;

  AuthenticationReposirotyImpl({
    required this.authenticationLocalDataSource,
    required this.authenticationRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, LoginResponse>> autoLogin() async {
    if (authenticationLocalDataSource.isAuthenticated()) {
      try {
        final token = authenticationLocalDataSource.login();
        return Right(token);
      } catch (e) {
        return const Left(
          CacheFailure(status: 401, message: "No Cridentials found"),
        );
      }
    } else {
      return const Left(
        CacheFailure(status: 401, message: "No Cridentials found"),
      );
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> login(
    LoginRequest loginRequest,
  ) async {
    if (networkInfo.isConnected) {
      try {
        final token = await authenticationRemoteDataSource.login(loginRequest);
        await authenticationLocalDataSource.cacheAuthentication(token);
        return Right(token);
      } catch (e) {
        return const Left(
          ServerFailure(status: 500, message: 'failed to login to server'),
        );
      }
    } else {
      return const Left(
        ServerFailure(status: 404, message: 'offline'),
      );
    }
  }

  @override
  Future<Either<Failure, RegisterResponse>> register(
    RegisterRequest registerRequest,
  ) async {
    if (networkInfo.isConnected) {
      try {
        final response = await authenticationRemoteDataSource.register(registerRequest);
        return Right(response);
      } catch (e) {
        return const Left(
          ServerFailure(status: 500, message: 'failed to login to server'),
        );
      }
    } else {
      return const Left(
        ServerFailure(status: 404, message: 'offline'),
      );
    }
  }

  @override
  Future<Either<Failure, VerificationResponse>> verifyEmail(
    VerificationRequest verificationRequest,
  ) async {
    if (networkInfo.isConnected) {
      try {
        final response = await authenticationRemoteDataSource.verify(verificationRequest);
        return Right(response);
      } catch (e) {
        return const Left(
          ServerFailure(status: 500, message: 'failed to login to server'),
        );
      }
    } else {
      return const Left(
        ServerFailure(status: 404, message: 'offline'),
      );
    }
  }

  @override
  Either<Failure, bool> isAuthenticated() {
    return Right(authenticationLocalDataSource.isAuthenticated());
  }

  @override
  Future<Either<Failure, void>> logout() async {
    if (authenticationLocalDataSource.isAuthenticated()) {
      await authenticationLocalDataSource.logout();
      return const Right(null);
    } else {
      return const Left(
        CacheFailure(
          status: 401,
          message: 'not logged in',
        ),
      );
    }
  }
  
  @override
  Future<Either<Failure, RefreshTokenResponse>> refreshToken() async {
    if (networkInfo.isConnected) {
      try {
        final token = await authenticationRemoteDataSource.refreshToken();
        final user = authenticationLocalDataSource.login() as LoginResponseHiveModel;
        user.token = token.token;
        user.save();
        return Right(token);
      } catch (e) {
        return const Left(
          ServerFailure(status: 500, message: 'failed to login to server'),
        );
      }
    } else {
      return const Left(
        ServerFailure(status: 404, message: 'offline'),
      );
    }
  }
}
