import '../../../../../common/data/models/json/message_header.dart';
import '../../../../domain/entities/update_profile_response.dart';

class UpdateProfileResponseJsonModel extends UpdateProfileResponse {
  UpdateProfileResponseJsonModel({
    required super.messageHeader,
  });
  factory UpdateProfileResponseJsonModel.fromJson(
      Map<String, dynamic> jsonMap) {
    return UpdateProfileResponseJsonModel(
      messageHeader: MessageHeaderJsonModel.fromJson(jsonMap),
    );
  }
  Map<String, dynamic> toJson() {
    return messageHeader.toJson();
  }
}
