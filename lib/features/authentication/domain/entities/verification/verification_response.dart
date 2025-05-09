import 'package:equatable/equatable.dart';

class VerificationResponse extends Equatable {
  final bool success;
  final String status;
  final String message;
  final int userId;
  final String code;
  final String token;

  const VerificationResponse({
    required this.success,
    required this.status,
    required this.message,
    required this.userId,
    required this.code,
    required this.token,
  });
  @override
  List<Object?> get props => [token, userId, success, status, code];
}
