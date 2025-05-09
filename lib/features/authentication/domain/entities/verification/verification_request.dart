import 'package:equatable/equatable.dart';

class VerificationRequest extends Equatable {
  final String code;
  final int userId;
  const VerificationRequest({required this.code, required this.userId});
  @override
  List<Object?> get props => [userId, code];
}
