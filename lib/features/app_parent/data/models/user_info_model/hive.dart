import 'package:hive/hive.dart';
// import 'package:zad_test/core/types/app_types.dart';
import 'package:zad_test/features/app_parent/domain/entities/user_info.dart';

part 'hive.g.dart';

@HiveType(typeId: 19)
enum UserType {
  @HiveField(0)
  student,
  @HiveField(1)
  teacher,
  @HiveField(2)
  parent,
  @HiveField(3)
  assistant,
  @HiveField(4)
  admin,
}

@HiveType(typeId: 18)
class UserInfoHiveModel extends UserInfo {
  UserInfoHiveModel({
    required super.id,
    required super.name,
    required super.email,
    required super.bio,
    required super.image,
    required super.role,
  });
  @override
  @HiveField(0)
  int get id => super.id;
  @override
  @HiveField(1)
  String get name => super.name;
  @override
  @HiveField(2)
  String get email => super.email;
  @override
  @HiveField(3)
  String? get bio => super.bio;
  @override
  @HiveField(4)
  String? get image => super.image;
  @override
  @HiveField(5)
  UserType get role => super.role;

  factory UserInfoHiveModel.of(UserInfo userInfo) {
    return UserInfoHiveModel(
      id: userInfo.id,
      name: userInfo.name,
      email: userInfo.email,
      bio: userInfo.bio,
      image: userInfo.image,
      role: userInfo.role,
    );
  }
}
