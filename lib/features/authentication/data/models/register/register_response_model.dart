import '../../../domain/entities/register/register_response.dart';

class RegisterResponseJsonModel extends RegisterResponse {
  const RegisterResponseJsonModel({
    required super.success,
    required super.status,
    required super.message,
    required super.userId,
  });
  factory RegisterResponseJsonModel.fromJson(Map<String, dynamic> jsonMap) {
    return RegisterResponseJsonModel(
      success: jsonMap['success'],
      status: jsonMap['status'],
      message: jsonMap['message'],
      userId: jsonMap['data']['user_id'],
    );
  }
}
