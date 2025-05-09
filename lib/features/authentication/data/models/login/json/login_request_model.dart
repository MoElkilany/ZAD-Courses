import '../../../../domain/entities/login/login_request.dart';

class LoginRequestJsonModel extends LoginRequest {
  const LoginRequestJsonModel({
    required super.username,
    required super.password,
  });
  Map<String, dynamic> toJson() {
    return {
      'username': super.username,
      'password': super.password,
    };
  }

  factory LoginRequestJsonModel.of(LoginRequest loginRequest) =>
      LoginRequestJsonModel(
        username: loginRequest.username,
        password: loginRequest.password,
      );
}
