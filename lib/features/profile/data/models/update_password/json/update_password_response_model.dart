import '../../../../../common/data/models/json/message_header.dart';
import '../../../../domain/entities/update_password_response.dart';

class UpdatePasswordResponseJsonModel extends UpdatePasswordResponse {
  UpdatePasswordResponseJsonModel({
    required super.messageHeader,
    required super.token,
  });
  factory UpdatePasswordResponseJsonModel.fromJson(
      Map<String, dynamic> jsonMap) {
    return UpdatePasswordResponseJsonModel(
      messageHeader: MessageHeaderJsonModel.fromJson(jsonMap),
      token: jsonMap['token'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      ...messageHeader.toJson(),
      'token': token,
    };
  }
}
