import 'package:hive/hive.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/login/login_response.dart';
import '../models/login/hive/login_response_model.dart';

abstract class AuthenticationLocalDataSource {
  static const authenticationBoxName = 'auth_box';
  static const tokenName = 'auth_token_name';
  LoginResponse login();
  Future<void> cacheAuthentication(LoginResponse loginResponse);
  bool isAuthenticated();
  Future<void> logout();
}

class AuthenticationLocalDataSourceImpl
    implements AuthenticationLocalDataSource {
  final Box authenticationBox;
  AuthenticationLocalDataSourceImpl(
    this.authenticationBox,
  );

  @override
  Future<void> cacheAuthentication(LoginResponse loginResponse) async {
    final v = LoginResponseHiveModel.of(loginResponse);
    await authenticationBox.put(AuthenticationLocalDataSource.tokenName, v);
  }

  @override
  bool isAuthenticated() {
    return authenticationBox
        .containsKey(AuthenticationLocalDataSource.tokenName);
  }

  @override
  LoginResponse login() {
    final result =
        authenticationBox.get(AuthenticationLocalDataSource.tokenName);
    if (result != null) {
      return result;
    } else {
      throw CacheException(status: 401, message: 'no cached token found');
    }
  }

  @override
  Future<void> logout() async {
    await authenticationBox.delete(AuthenticationLocalDataSource.tokenName);
  }
}
