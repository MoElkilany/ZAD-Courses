import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../core/platform/network_info.dart';
import '../features/app_parent/data/data_sources/settings_local_data_source.dart';
import '../features/app_parent/data/data_sources/settings_remote_data_source.dart';
import '../features/app_parent/data/models/auth_info_model/auth_info_model.dart';
import '../features/app_parent/data/models/language_model/hive.dart';
import '../features/app_parent/data/models/user_info_model/user_info_model.dart';
import '../features/app_parent/data/repositories/app_settings_repository_impl.dart';
import '../features/app_parent/domain/entities/language.dart';
import '../features/app_parent/domain/repositories/app_settings_repository.dart';
import '../features/app_parent/domain/usecases/cache_auth_info.dart';
import '../features/app_parent/domain/usecases/cache_language_info.dart';
import '../features/app_parent/domain/usecases/cache_user_info.dart';
import '../features/app_parent/domain/usecases/clear_auth_info.dart';
import '../features/app_parent/domain/usecases/clear_user_info.dart';
import '../features/app_parent/domain/usecases/get_auth_info.dart';
import '../features/app_parent/domain/usecases/get_language_info.dart';
import '../features/app_parent/domain/usecases/get_notifications.dart';
import '../features/app_parent/domain/usecases/get_user_info.dart';
import '../features/app_parent/domain/usecases/mark_notification_read.dart';
import '../features/app_parent/domain/usecases/try_login.dart';
import 'external_services.dart';

class AppSettingsDI {
  static Future<List<Override>> init() async {
    return [
      AppSettingsDI._localDataSource.overrideWithValue(
        await AppSettingsDI.initLocalDataSource(),
      ),
    ];
  }

  ///////////////////////////////\
  /// data sources //////////////\\
  ///////////////////////////////\\\
  static final _localDataSource = Provider<SettingsLocalDataSource>((ref) {
    throw UnimplementedError();
  });
  static Future<SettingsLocalDataSource> initLocalDataSource() async {
    Hive.registerAdapter(LanguageHiveModelAdapter());
    final translationsBox = await Hive.openBox<Language>(
      SettingsLocalDataSource.cachedLocale,
    );
    Hive.registerAdapter(AuthInfoHiveModelAdapter());
    Hive.registerAdapter(UserInfoHiveModelAdapter());
    Hive.registerAdapter(UserTypeAdapter());

    final settingsBox = await Hive.openBox<dynamic>(
      SettingsLocalDataSource.cachedAuthInfo,
    );
    return SettingsLocalDataSourceImpl(localeBox: translationsBox, settingsBox: settingsBox);
  }

  static final _remoteDataSource = Provider<SettingsRemoteDataSource>((ref) {
    final dio = ref.read(ExternalServices.dio);
    return SettingsRemoteDataSourceImpl(
      dio: dio,
    );
  });
  ///////////////////////////////\
  /// data repository  //////////\\
  ///////////////////////////////\\\
  static final settingsRepository = Provider<SettingsRepository>((ref) {
    final local = ref.watch(_localDataSource);
    final remote = ref.read(_remoteDataSource);
    final ninfo = ref.read(networkInfo);
    return SettingsRepositoryImpl(
      settingsLocalDataSource: local,
      settingsRemoteDataSource: remote,
      networkInfo: ninfo,
    );
  });
  ///////////////////////////////\
  /// usecases     //////////////\\
  ///////////////////////////////\\\

  static final getLocale = Provider<GetLanguage>((ref) {
    final repo = ref.watch(settingsRepository);
    return GetLanguage(repo);
  });

  static final cacheLocale = Provider<CacheLanguage>((ref) {
    final repo = ref.watch(settingsRepository);
    return CacheLanguage(repo);
  });

  static final getAuthInfo = Provider<GetAuthInfo>((ref) {
    final repo = ref.watch(settingsRepository);
    return GetAuthInfo(repo);
  });

  static final cacheAuthInfo = Provider<CacheAuthInfo>((ref) {
    final repo = ref.watch(settingsRepository);
    return CacheAuthInfo(repo);
  });

  static final getUserInfo = Provider<GetUserInfo>((ref) {
    final repo = ref.watch(settingsRepository);
    return GetUserInfo(repo);
  });

  static final cacheUserInfo = Provider<CacheUserInfo>((ref) {
    final repo = ref.watch(settingsRepository);
    return CacheUserInfo(repo);
  });

  static final getNotifications = Provider<GetNotifications>((ref) {
    final repo = ref.watch(settingsRepository);
    return GetNotifications(repo);
  });

  static final markNotificationRead = Provider<MarkNotificationRead>((ref) {
    final repo = ref.watch(settingsRepository);
    return MarkNotificationRead(repo);
  });

  static final clearAuthInfo = Provider<ClearAuthInfo>((ref) {
    final repo = ref.watch(settingsRepository);
    return ClearAuthInfo(repo);
  });

  static final clearUserInfo = Provider<ClearUserInfo>((ref) {
    final repo = ref.watch(settingsRepository);
    return ClearUserInfo(repo);
  });

  static final tryLogin = Provider<TryLogin>((ref) {
    final repo = ref.watch(settingsRepository);
    return TryLogin(repo);
  });

  ///////////////////////////////\
}
