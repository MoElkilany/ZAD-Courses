import '../../../../domain/entities/update_password_request.dart';

class UpdatePasswordRequestJsonModel extends UpdatePasswordRequest {
  const UpdatePasswordRequestJsonModel({
    required super.currentPassword,
    required super.newPassword,
  });
  factory UpdatePasswordRequestJsonModel.fromJson(
      Map<String, dynamic> jsonMap) {
    return UpdatePasswordRequestJsonModel(
      currentPassword: jsonMap['current_password'],
      newPassword: jsonMap['new_password'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'current_password': currentPassword,
      'new_password': newPassword,
    };
  }
}
