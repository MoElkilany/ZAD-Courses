import 'package:dartz/dartz.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../di/authentication.dart';
import '../../domain/entities/login/login_request.dart';
import '../../domain/entities/login/login_response.dart';

import '../../../../core/error/failures.dart';

part 'login.g.dart';

@riverpod
Future<Either<Failure, LoginResponse>> login(
  Ref ref, {
  required LoginRequest loginRequest,
}) async {
  final login = ref.read(AuthenticationDI.login);
  final res = await login(loginRequest);
  return res;
}

@Riverpod(keepAlive: true)
class Username extends _$Username {
  @override
  String build() {
    return '';
  }

  get username => state;

  void setUsername(String username) {
    state = username;
  }
}

@Riverpod(keepAlive: true)
class Password extends _$Password {
  @override
  String build() {
    return '';
  }

  get password => state;

  void setPassword(String password) {
    state = password;
  }
}
