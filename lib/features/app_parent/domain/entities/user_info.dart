import '../../data/models/user_info_model/hive.dart';

class UserInfo {
  final int id;
  final String name;
  final UserType role;
  final String email;
  final String? bio;
  final String? image;

  UserInfo({
    required this.id,
    required this.name,
    required this.role,
    required this.email,
    this.bio,
    this.image,
  });

  bool isTeacher() => role == UserType.teacher || role == UserType.assistant;
}
