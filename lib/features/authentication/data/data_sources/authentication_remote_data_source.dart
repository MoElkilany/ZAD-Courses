import 'package:dio/dio.dart';

import '../../../../core/config/endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../app_parent/domain/entities/auth_info.dart';
import '../../../app_parent/domain/repositories/app_settings_repository.dart';
import '../../domain/entities/login/login_request.dart';
import '../../domain/entities/login/login_response.dart';
import '../../domain/entities/login/refresh_token_response.dart';
import '../../domain/entities/register/register_request.dart';
import '../../domain/entities/register/register_response.dart';
import '../../domain/entities/verification/verification_request.dart';
import '../../domain/entities/verification/verification_response.dart';
import '../models/login/json/login_request_model.dart';
import '../models/login/json/login_response_model.dart';
import '../models/login/json/refresh_token_response_model.dart';
import '../models/register/register_request_model.dart';
import '../models/register/register_response_model.dart';
import '../models/verify/verification_request_model.dart';
import '../models/verify/verification_response_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<RegisterResponse> register(RegisterRequest registerRequest);
  Future<RefreshTokenResponse> refreshToken();
  Future<VerificationResponse> verify(VerificationRequest verificationRequest);
}

class AuthenticationRemoteDataSourceImpl implements AuthenticationRemoteDataSource {
  final Dio dio;
  final SettingsRepository settingsRepository;
  AuthenticationRemoteDataSourceImpl({
    required this.dio,
    required this.settingsRepository,
  });

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    final v = LoginRequestJsonModel.of(loginRequest);
    final res = await _handleRequest(
      endpoint: Endpoints.login,
      req: v.toJson(),
    );
    final loginRes = LoginResponseJsonModel.fromJson(res);
    if (loginRes.success) {
      settingsRepository.cacheAuthInfo(AuthInfo(token: loginRes.token));
    }
    return loginRes;
  }

  @override
  Future<RefreshTokenResponse> refreshToken() async {
    final res = await _handleRequest(
      endpoint: Endpoints.refreshToken,
      req: {},
    );
    return RefreshTokenResponseJsonModel.fromJson(res);
  }

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    final v = RegisterRequestJsonModel.of(registerRequest);
    final res = await _handleRequest(
      endpoint: Endpoints.register,
      req: v.toJson(),
    );
    return RegisterResponseJsonModel.fromJson(res);
  }

  @override
  Future<VerificationResponse> verify(VerificationRequest verificationRequest) async {
    final v = VerificationRequestJsonModel.of(verificationRequest);
    final res = await _handleRequest(
      endpoint: Endpoints.verify,
      req: v.toJson(),
    );
    return VerificationResponseJsonModel.fromJson(res);
  }

  Future<Map<String, dynamic>> _handleRequest({
    required String endpoint,
    required Map<String, dynamic> req,
  }) async {
    late final Response res;
    final exception = ServerException(status: 500, message: 'Server Error');
    try {
      res = await dio.post(
        endpoint,
        data: req,
      );
    } catch (e) {
      throw exception;
    }
    if ((res.statusCode ?? 999) < 300) {
      final data = res.data as Map<String, dynamic>;
      return data;
    } else if (res.statusCode == 401) {
      throw ServerException(status: 401, message: 'Bad Credintals');
    } else {
      throw exception;
    }
  }
}
