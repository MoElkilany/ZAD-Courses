import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../app_parent/domain/repositories/app_settings_repository.dart';
import '../entities/login/login_request.dart';
import '../entities/login/login_response.dart';
import '../repositories/authentication_repository.dart';

class Login implements UseCase<LoginResponse, LoginRequest> {
  Login({
    required this.authenticationReposiroty,
    required this.dio,
    required this.settingsRepository,
  });
  final AuthenticationReposiroty authenticationReposiroty;
  final Dio dio;

  final SettingsRepository settingsRepository;

  @override
  Future<Either<Failure, LoginResponse>> call(
    LoginRequest loginRequest,
  ) async {
    final loginResponse = await authenticationReposiroty.login(loginRequest);
    loginResponse.fold(
      (l) => null,
      (r) {
        dio.interceptors.clear();
        dio.interceptors.add(QueuedInterceptorsWrapper(
          onRequest: (options, handler) {
            log(r.token);
            options.headers['Authorization'] = 'Bearer ${r.token}';
            return handler.next(options);
          },
          onError: (e, handler) async {
            if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
              final authInfoRes = await settingsRepository.getAuthInfo();
              final authInfo = authInfoRes.fold((l) => null, (r) => r);
              if (authInfo == null) {
                return handler.next(e);
              }
              await settingsRepository.tryLogin(authInfo);
              //retry the request
              //create request with new access token
              final opts = Options(method: e.requestOptions.method, headers: e.requestOptions.headers);
              final cloneReq = await dio.request(e.requestOptions.path,
                  options: opts, data: e.requestOptions.data, queryParameters: e.requestOptions.queryParameters);

              return handler.resolve(cloneReq);
            }
            return handler.next(e);
          },
        ));
      },
    );
    return loginResponse;
  }
}
