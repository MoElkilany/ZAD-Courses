import 'package:equatable/equatable.dart';

class MessageHeader extends Equatable {
  final bool success;
  final String status;
  final String message;

  const MessageHeader({
    required this.success,
    required this.status,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'status': status,
      'message': message,
    };
  }

  @override
  List<Object?> get props => [success, status, message];
}
