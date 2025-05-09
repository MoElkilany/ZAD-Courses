import 'package:hive/hive.dart';
import '../../../domain/entities/auth_info.dart';

part 'hive.g.dart';

@HiveType(typeId: 17)
class AuthInfoHiveModel extends AuthInfo {
  AuthInfoHiveModel({
    required super.token,
  });
  @override
  @HiveField(0)
  String get token => super.token;

  factory AuthInfoHiveModel.of(AuthInfo authInfo) {
    return AuthInfoHiveModel(
      token: authInfo.token,
    );
  }
}
