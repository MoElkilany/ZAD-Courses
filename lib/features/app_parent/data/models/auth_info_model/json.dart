import '../../../domain/entities/auth_info.dart';

extension AuthInfoJsonModel on AuthInfo {
  static AuthInfo fromJson(Map<String, dynamic> json) {
    return AuthInfo(
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}
