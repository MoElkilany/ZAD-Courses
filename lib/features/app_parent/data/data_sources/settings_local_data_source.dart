import 'package:hive/hive.dart';
import '../../../../core/error/exceptions.dart';
import '../models/auth_info_model/auth_info_model.dart';
import '../models/user_info_model/user_info_model.dart';
import '../../domain/entities/auth_info.dart';
import '../../domain/entities/user_info.dart';
import '../../domain/entities/language.dart';
import '../models/language_model/language_model.dart';

abstract class SettingsLocalDataSource {
  static const cachedLocale = 'CACHED_LOCALE';
  static const cachedAuthInfo = 'CACHED_AUTH_INFO';
  static const cachedUserInfo = 'CACHED_USER_INFO';

  Future<Language> getLocale();
  Future<void> cacheLocale(Language language);

  Future<AuthInfo> getAuthInfo();
  Future<void> cacheAuthInfo(AuthInfo authInfo);
  Future<void> clearAuthInfo();

  Future<UserInfo> getUserInfo();
  Future<void> cacheUserInfo(UserInfo userInfo);
  Future<void> clearUserInfo();
}

class SettingsLocalDataSourceImpl extends SettingsLocalDataSource {
  final Box<Language> localeBox;
  final Box<dynamic> settingsBox;

  SettingsLocalDataSourceImpl({
    required this.localeBox,
    required this.settingsBox,
  });

  @override
  Future<void> cacheLocale(
    Language language,
  ) async {
    localeBox.put(SettingsLocalDataSource.cachedLocale, LanguageHiveModel.of(language));
  }

  @override
  Future<Language> getLocale() async {
    final l = localeBox.get(SettingsLocalDataSource.cachedLocale);

    if (l == null) {
      throw CacheException(status: 500, message: 'No cached locale');
    }

    return l;
  }

  @override
  Future<void> cacheAuthInfo(AuthInfo authInfo) async {
    settingsBox.put(SettingsLocalDataSource.cachedAuthInfo, AuthInfoHiveModel.of(authInfo));
  }

  @override
  Future<void> clearAuthInfo() async {
    settingsBox.delete(SettingsLocalDataSource.cachedAuthInfo);
  }

  @override
  Future<AuthInfo> getAuthInfo() async {
    final i = settingsBox.get(SettingsLocalDataSource.cachedAuthInfo);
    if (i == null) {
      throw CacheException(status: 500, message: 'No cached auth info');
    }
    return i;
  }

  @override
  Future<void> cacheUserInfo(UserInfo userInfo) async {
    settingsBox.put(SettingsLocalDataSource.cachedUserInfo, UserInfoHiveModel.of(userInfo));
  }

  @override
  Future<void> clearUserInfo() async {
    settingsBox.delete(SettingsLocalDataSource.cachedUserInfo);
  }

  @override
  Future<UserInfo> getUserInfo() async {
    final i = settingsBox.get(SettingsLocalDataSource.cachedUserInfo);
    if (i == null) {
      throw CacheException(status: 500, message: 'No cached user info');
    }
    return i;
  }
}
