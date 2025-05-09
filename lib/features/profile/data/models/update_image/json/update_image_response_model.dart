import '../../../../../common/data/models/json/message_header.dart';
import '../../../../domain/entities/update_image_response.dart';

class UpdateImageResponseJsonModel extends UpdateImageResponse {
  UpdateImageResponseJsonModel({required super.messageHeader});
  factory UpdateImageResponseJsonModel.fromJson(Map<String, dynamic> jsonMap) {
    return UpdateImageResponseJsonModel(
      messageHeader: MessageHeaderJsonModel.fromJson(jsonMap),
    );
  }
  Map<String, dynamic> toJson() {
    return messageHeader.toJson();
  }
}
