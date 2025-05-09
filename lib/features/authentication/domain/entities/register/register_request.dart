import 'package:equatable/equatable.dart';

class RegisterRequest extends Equatable {
  final String countryCode;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String fullName;

  const RegisterRequest({
    required this.countryCode,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.fullName,
  });
  @override
  List<Object?> get props => [
        countryCode,
        email,
        password,
        passwordConfirmation,
        fullName,
      ];
}
