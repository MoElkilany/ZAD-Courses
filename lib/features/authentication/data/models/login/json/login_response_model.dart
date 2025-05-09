import '../../../../domain/entities/login/login_response.dart';

class LoginResponseJsonModel extends LoginResponse {
  const LoginResponseJsonModel({
    required super.success,
    required super.status,
    required super.message,
    required super.userId,
    required super.token,
  });

  factory LoginResponseJsonModel.fromJson(Map<String, dynamic> jsonMap) {
    return LoginResponseJsonModel(
      success: jsonMap['success'],
      status: jsonMap['status'],
      message: jsonMap['message'],
      userId: jsonMap['data']['user_id'],
      token: jsonMap['data']['token'],
    );
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "success": success,
      "status": status,
      "message": message,
      "data": {
        "user_id": userId,
        "token": token,
      }
    };
  }

  //copyWith
  LoginResponseJsonModel copyWith({
    bool? success,
    String? status,
    String? message,
    int? userId,
    String? code,
    String? token,
  }) {
    return LoginResponseJsonModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      userId: userId ?? this.userId,
      token: token ?? this.token,
    );
  }
}
