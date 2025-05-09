import '../../../domain/entities/verification/verification_response.dart';

class VerificationResponseJsonModel extends VerificationResponse {
  const VerificationResponseJsonModel({
    required super.success,
    required super.status,
    required super.message,
    required super.userId,
    required super.code,
    required super.token,
  });
  factory VerificationResponseJsonModel.fromJson(Map<String, dynamic> jsonMap) {
    return VerificationResponseJsonModel(
      success: jsonMap['success'],
      status: jsonMap['status'],
      message: jsonMap['message'],
      userId: jsonMap['data']['user_id'],
      code: jsonMap['data']['code'],
      token: jsonMap['data']['token'],
    );
  }
}
