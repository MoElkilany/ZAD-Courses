import '../../../domain/entities/register/register_request.dart';

class RegisterRequestJsonModel extends RegisterRequest {
  const RegisterRequestJsonModel({
    required super.countryCode,
    required super.email,
    required super.password,
    required super.passwordConfirmation,
    required super.fullName,
  });
  factory RegisterRequestJsonModel.of(RegisterRequest registerRequest) {
    return RegisterRequestJsonModel(
      fullName: registerRequest.fullName,
      countryCode: registerRequest.countryCode,
      email: registerRequest.email,
      password: registerRequest.password,
      passwordConfirmation: registerRequest.passwordConfirmation,
    );
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'country_code': countryCode,
      'full_name': fullName,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }
}
