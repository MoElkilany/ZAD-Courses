import '../../../../domain/entities/login/refresh_token_response.dart';

class RefreshTokenResponseJsonModel extends RefreshTokenResponse {
  const RefreshTokenResponseJsonModel({required super.token});
  factory RefreshTokenResponseJsonModel.fromJson(Map<String, dynamic> jsonMap) {
    return RefreshTokenResponseJsonModel(
      token: jsonMap["token"],
    );
  }
}
