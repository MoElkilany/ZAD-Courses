import 'package:dartz/dartz.dart';
import '../entities/auth_info.dart';
import '../entities/user_info.dart';
import '../entities/zad_notification.dart';

import '../../../../core/error/failures.dart';
import '../entities/language.dart';

abstract class SettingsRepository {
  Future<Either<Failure, Language>> getLanguage();
  Future<Either<Failure, void>> cacheLanguage(Language language);

  Future<Either<Failure, AuthInfo>> getAuthInfo();
  Future<Either<Failure, void>> cacheAuthInfo(AuthInfo authInfo);
  Future<Either<Failure, void>> clearAuthInfo();

  Future<Either<Failure, UserInfo>> getUserInfo();
  Future<Either<Failure, void>> cacheUserInfo(UserInfo userInfo);
  Future<Either<Failure, void>> clearUserInfo();

  Future<Either<Failure, void>> tryLogin(AuthInfo authInfo);
  Future<Either<Failure, void>> setInterceptors(AuthInfo authInfo);

  Future<Either<Failure, List<ZadNotification>>> getNotifications();
  Future<Either<Failure, bool>> markNotificationRead(int notificationId);
}
