// ignore_for_file: overridden_fields

import 'package:hive/hive.dart';

import '../../../../domain/entities/login/login_response.dart';

part 'login_response_model.g.dart';

@HiveType(typeId: 0)
// ignore: must_be_immutable
class LoginResponseHiveModel extends HiveObject implements LoginResponse {
  @override
  @HiveField(0)
  final bool success;
  @override
  @HiveField(1)
  final String status;
  @override
  @HiveField(2)
  final String message;
  @override
  @HiveField(3)
  final int userId;

  @override
  @HiveField(5)
  String token;

  LoginResponseHiveModel({
    required this.success,
    required this.status,
    required this.message,
    required this.userId,
    required this.token,
  });
  factory LoginResponseHiveModel.of(LoginResponse loginResponse) {
    return LoginResponseHiveModel(
      success: loginResponse.success,
      status: loginResponse.status,
      message: loginResponse.message,
      userId: loginResponse.userId,
      token: loginResponse.token,
    );
  }
  // LoginResponse toLoginResponse() {
  //   return LoginResponse(
  //     success: success,
  //     status: status,
  //     message: message,
  //     userId: userId,
  //     code: code,
  //     token: token,
  //   );
  // }

  @override
  int get hashCode => token.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is LoginResponseHiveModel) {
      return hashCode == other.hashCode;
    } else {
      return false;
    }
  }

  @override
  List<Object?> get props => [token, userId, token, status];

  @override
  bool? get stringify => true;
}
