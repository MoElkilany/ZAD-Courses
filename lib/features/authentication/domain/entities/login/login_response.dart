import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final bool success;
  final String status;
  final String message;
  final int userId;

  final String token;

  const LoginResponse({
    required this.success,
    required this.status,
    required this.message,
    required this.userId,
    required this.token,
  });
  @override
  List<Object?> get props => [
        success,
        status,
        message,
        userId,
        token,
      ];
}
