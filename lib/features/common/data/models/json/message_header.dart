import '../../../domain/entities/message_header.dart';

class MessageHeaderJsonModel extends MessageHeader {
  const MessageHeaderJsonModel({
    required super.success,
    required super.status,
    required super.message,
  });
  factory MessageHeaderJsonModel.fromJson(Map<String, dynamic> jsonMap) {
    return MessageHeaderJsonModel(
      message: jsonMap['message'],
      status: jsonMap['status'],
      success: jsonMap['success'],
    );
  }
  @override
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'status': status,
      'message': message,
    };
  }
}
