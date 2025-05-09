import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/platform/network_info.dart';
import '../data_sources/settings_local_data_source.dart';
import '../data_sources/settings_remote_data_source.dart';
import '../../domain/entities/auth_info.dart';
import '../../domain/entities/user_info.dart';
import '../../domain/entities/zad_notification.dart';
import '../../domain/repositories/app_settings_repository.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/language.dart';

class SettingsRepositoryImpl extends SettingsRepository {
  final SettingsLocalDataSource settingsLocalDataSource;
  final SettingsRemoteDataSource settingsRemoteDataSource;
  final NetworkInfo networkInfo;
  SettingsRepositoryImpl({
    required this.settingsLocalDataSource,
    required this.networkInfo,
    required this.settingsRemoteDataSource,
  });

  @override
  Future<Either<Failure, Language>> getLanguage() async {
    try {
      final language = await settingsLocalDataSource.getLocale();
      return Right(language);
    } on CacheException catch (e) {
      return Left(CacheFailure(status: e.status, message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(status: e.status, message: e.message));
    } on Exception catch (e) {
      return Left(ServerFailure(status: 500, message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheLanguage(Language language) async {
    try {
      await settingsLocalDataSource.cacheLocale(language);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(status: e.status, message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(status: e.status, message: e.message));
    } on Exception catch (e) {
      return Left(ServerFailure(status: 500, message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheAuthInfo(AuthInfo authInfo) async {
    try {
      await settingsLocalDataSource.cacheAuthInfo(authInfo);
      await settingsRemoteDataSource.setInterceptors(authInfo);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(status: e.status, message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(status: e.status, message: e.message));
    } on Exception catch (e) {
      return Left(ServerFailure(status: 500, message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthInfo>> getAuthInfo() async {
    try {
      final authInfo = await settingsLocalDataSource.getAuthInfo();
      return Right(authInfo);
    } on CacheException catch (e) {
      return Left(CacheFailure(status: e.status, message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(status: e.status, message: e.message));
    } on Exception catch (e) {
      return Left(ServerFailure(status: 500, message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheUserInfo(UserInfo userInfo) async {
    try {
      await settingsLocalDataSource.cacheUserInfo(userInfo);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(status: e.status, message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(status: e.status, message: e.message));
    } on Exception catch (e) {
      return Left(ServerFailure(status: 500, message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserInfo>> getUserInfo() async {
    if (networkInfo.isConnected) {
      try {
        final UserInfo userInfo;
        userInfo = await settingsRemoteDataSource.getUserInfo().then((value) async {
          await settingsLocalDataSource.cacheUserInfo(value);
          return value;
        });
        return Right(userInfo);
      } on ServerException catch (e) {
        return Left(ServerFailure(status: e.status, message: e.message));
      } on Exception catch (e) {
        return Left(ServerFailure(status: 500, message: e.toString()));
      }
    } else {
      try {
        final userInfo = await settingsLocalDataSource.getUserInfo();
        return Right(userInfo);
      } on CacheException catch (e) {
        return Left(CacheFailure(status: e.status, message: e.message));
      } on Exception catch (e) {
        return Left(ServerFailure(status: 500, message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ZadNotification>>> getNotifications() async {
    if (networkInfo.isConnected) {
      try {
        final notifications = await settingsRemoteDataSource.getNotifications();
        return Right(notifications);
      } on ServerException catch (e) {
        return Left(ServerFailure(status: e.status, message: e.message));
      } on Exception catch (e) {
        return Left(ServerFailure(status: 500, message: e.toString()));
      }
    } else {
      throw ServerException(status: 500, message: 'Error connecting to server');
    }
  }

  @override
  Future<Either<Failure, bool>> markNotificationRead(int notificationId) async {
    if (networkInfo.isConnected) {
      try {
        final isSeen = await settingsRemoteDataSource.markNotificationsRead(notificationId);
        return Right(isSeen);
      } on ServerException catch (e) {
        return Left(ServerFailure(status: e.status, message: e.message));
      } on Exception catch (e) {
        return Left(ServerFailure(status: 500, message: e.toString()));
      }
    } else {
      throw ServerException(status: 500, message: 'Error connecting to server');
    }
  }

  @override
  Future<Either<Failure, void>> clearAuthInfo() async {
    try {
      await settingsLocalDataSource.clearAuthInfo();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(status: e.status, message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(status: e.status, message: e.message));
    } on Exception catch (e) {
      return Left(ServerFailure(status: 500, message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearUserInfo() async {
    try {
      await settingsLocalDataSource.clearUserInfo();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(status: e.status, message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(status: e.status, message: e.message));
    } on Exception catch (e) {
      return Left(ServerFailure(status: 500, message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> tryLogin(AuthInfo authInfo) async {
    if (networkInfo.isConnected) {
      try {
        final res = await settingsRemoteDataSource.refreshToken(authInfo);
        await settingsRemoteDataSource.setInterceptors(res);
        await settingsLocalDataSource.cacheAuthInfo(res);
        return const Right(null);
      } on ServerException catch (e) {
        return Left(ServerFailure(status: e.status, message: e.message));
      } on Exception catch (e) {
        return Left(ServerFailure(status: 500, message: e.toString()));
      }
    } else {
      return const Left(ServerFailure(status: 500, message: 'Error connecting to server'));
    }
  }

  @override
  Future<Either<Failure, void>> setInterceptors(AuthInfo authInfo) async {
    try {
      await settingsRemoteDataSource.setInterceptors(authInfo);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(status: e.status, message: e.message));
    } on Exception catch (e) {
      return Left(ServerFailure(status: 500, message: e.toString()));
    }
  }
}
