import 'package:equatable/equatable.dart';

class UpdatePasswordRequest extends Equatable {
  final String currentPassword;
  final String newPassword;

  const UpdatePasswordRequest({
    required this.currentPassword,
    required this.newPassword,
  });

  @override
  List<Object?> get props => [currentPassword, newPassword];
}
