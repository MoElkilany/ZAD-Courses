import 'package:equatable/equatable.dart';

class RegisterResponse extends Equatable {
  final bool success;
  final String status;
  final String message;
  final int userId;

  const RegisterResponse({
    required this.success,
    required this.status,
    required this.message,
    required this.userId,
  });
  @override
  List<Object?> get props => [];
}
