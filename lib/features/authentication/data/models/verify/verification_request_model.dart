import '../../../domain/entities/verification/verification_request.dart';

class VerificationRequestJsonModel extends VerificationRequest {
  const VerificationRequestJsonModel({
    required super.code,
    required super.userId,
  });
  factory VerificationRequestJsonModel.of(
      VerificationRequest verificationRequest) {
    return VerificationRequestJsonModel(
      code: verificationRequest.code,
      userId: verificationRequest.userId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "code": code,
    };
  }
}
