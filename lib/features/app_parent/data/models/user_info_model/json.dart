import 'hive.dart';
import '../../../domain/entities/user_info.dart';

extension UserInfoJsonModel on UserInfo {
  static UserInfo fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'],
      name: json['full_name'],
      email: json['email'],
      role: json['role_name'] == 'user'
          ? UserType.student
          : json['role_name'] == 'teacher'
              ? UserType.teacher
              : json['role_name'] == 'parent'
                  ? UserType.parent
                  : json['role_name'] == 'admin'
                      ? UserType.admin
                      : UserType.assistant,
      bio: json['bio'],
      image: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': name,
      'email': email,
      'role_name': role,
      'bio': bio,
      'avatar': image,
    };
  }
}
