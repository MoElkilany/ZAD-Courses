import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import '../../../../core/config/endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../di/external_services.dart';
import '../models/user_info_model/user_info_model.dart';
import '../models/zad_notification_model/zad_notification_model.dart';
import '../../domain/entities/auth_info.dart';
import '../../domain/entities/user_info.dart';
import '../../domain/entities/zad_notification.dart';

abstract class SettingsRemoteDataSource {
  Future<UserInfo> getUserInfo();
  Future<List<ZadNotification>> getNotifications();
  Future<bool> markNotificationsRead(int notificationId);
  Future<AuthInfo> refreshToken(AuthInfo token);
  Future<void> setInterceptors(AuthInfo token);
}

final settingsRemoteDataSource = Provider<SettingsRemoteDataSource>((ref) {
  final dio = ref.read(ExternalServices.dio);
  return SettingsRemoteDataSourceImpl(
    dio: dio,
  );
});

class SettingsRemoteDataSourceImpl extends SettingsRemoteDataSource {
  final Dio dio;

  SettingsRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<UserInfo> getUserInfo() async {
    try {
      final res = await dio.get(Endpoints.userInfo);
      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        if (data['success'] == false) {
          throw ServerException(status: 404, message: "endpoint not found");
        }
        return UserInfoJsonModel.fromJson(data['data']['user']);
      } else if (res.statusCode == 404) {
        throw ServerException(status: 404, message: "endpoint not found");
      } else if (res.statusCode == 500) {
        throw ServerException(status: 500, message: "Internal Server Error");
      } else if (res.statusCode == 403) {
        throw ServerException(status: 403, message: "Forbidden Access");
      } else if (res.statusCode == 401) {
        throw ServerException(status: 403, message: "Unauthorized Access");
      } else {
        throw ServerException(status: 999, message: "connection unkown error");
      }
    } catch (e) {
      throw ServerException(status: 500, message: "Couldn't connect to server");
    }
  }

  @override
  Future<List<ZadNotification>> getNotifications() async {
    try {
      final res = await dio.get(Endpoints.notifications);
      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        if (data['success'] == false) {
          throw ServerException(status: 404, message: "endpoint not found");
        }
        final notifications = data['data']['notifications'] as List;
        return notifications.map((e) => ZadNotificationJsonModel.fromJson(e)).toList();
      } else if (res.statusCode == 404) {
        throw ServerException(status: 404, message: "endpoint not found");
      } else if (res.statusCode == 500) {
        throw ServerException(status: 500, message: "Internal Server Error");
      } else if (res.statusCode == 403) {
        throw ServerException(status: 403, message: "Forbidden Access");
      } else if (res.statusCode == 401) {
        throw ServerException(status: 403, message: "Unauthorized Access");
      } else {
        throw ServerException(status: 999, message: "connection unkown error");
      }
    } catch (e) {
      throw ServerException(status: 500, message: "Couldn't connect to server");
    }
  }

  @override
  Future<bool> markNotificationsRead(int notificationId) async {
    try {
      final res = await dio.post('${Endpoints.notifications}${notificationId.toString()}${Endpoints.markAsReadExtension}');
      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        if (data['status'] == 'already_seen' || data['status'] == 'seen') {
          return true;
        }
        return false;
      } else if (res.statusCode == 404) {
        throw ServerException(status: 404, message: "endpoint not found");
      } else if (res.statusCode == 500) {
        throw ServerException(status: 500, message: "Internal Server Error");
      } else if (res.statusCode == 403) {
        throw ServerException(status: 403, message: "Forbidden Access");
      } else if (res.statusCode == 401) {
        throw ServerException(status: 403, message: "Unauthorized Access");
      } else {
        throw ServerException(status: 999, message: "connection unkown error");
      }
    } catch (e) {
      throw ServerException(status: 500, message: "Couldn't connect to server");
    }
  }

  @override
  Future<AuthInfo> refreshToken(AuthInfo token) async {
    setInterceptors(token);
    try {
      final res = await dio.post(Endpoints.refreshToken);
      if (res.statusCode == 200) {
        final data = res.data;
        return AuthInfo(token: data['token']);
      } else if (res.statusCode == 404) {
        throw ServerException(status: 404, message: "endpoint not found");
      } else if (res.statusCode == 500) {
        throw ServerException(status: 500, message: "Internal Server Error");
      } else if (res.statusCode == 403) {
        throw ServerException(status: 403, message: "Forbidden Access");
      } else if (res.statusCode == 401) {
        throw ServerException(status: 403, message: "Unauthorized Access");
      } else {
        throw ServerException(status: 999, message: "connection unkown error");
      }
    } catch (e) {
      throw ServerException(status: 500, message: "Couldn't connect to server");
    }
  }

  @override
  Future<void> setInterceptors(AuthInfo token) async {
    dio.interceptors.clear();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    dio.interceptors.add(QueuedInterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'Bearer ${token.token}';
        return handler.next(options);
      },
      onError: (e, handler) async {
        if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
          await refreshToken(AuthInfo(token: token.token));
          //retry the request
          //create request with new access token
          final opts = Options(method: e.requestOptions.method, headers: e.requestOptions.headers);
          final cloneReq =
              await dio.request(e.requestOptions.path, options: opts, data: e.requestOptions.data, queryParameters: e.requestOptions.queryParameters);

          return handler.resolve(cloneReq);
        }
        return handler.next(e);
      },
    ));
  }
}
