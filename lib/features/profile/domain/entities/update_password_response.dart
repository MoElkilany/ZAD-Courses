import '../../../common/domain/entities/message_header.dart';

class UpdatePasswordResponse {
  final MessageHeader messageHeader;
  final String token;

  UpdatePasswordResponse({
    required this.messageHeader,
    required this.token,
  });
}
