import '../../../../domain/entities/update_profile_request.dart';

class UpdateProfileRequestJsonModel extends UpdateProfileRequest {
  const UpdateProfileRequestJsonModel({
    required super.language,
    required super.fullName,
  });
  factory UpdateProfileRequestJsonModel.fromJson(Map<String, dynamic> jsonMap) {
    return UpdateProfileRequestJsonModel(
      language: jsonMap['language'],
      fullName: jsonMap['full_name'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'language': language,
      'full_name': fullName,
    };
  }
}
