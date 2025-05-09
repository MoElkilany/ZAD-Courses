import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../di/external_services.dart';
import '../models/home_info_model.dart';

final homeInformationRemoteDataSource = Provider<HomeInformationRemoteDataSource>((ref) {
  final dio = ref.read(ExternalServices.dio);
  return HomeInformationRemoteDataSourceImpl(dio);
});

abstract class HomeInformationRemoteDataSource {
  Future<HomeInformationModel> getHomeInformation();
}

class HomeInformationRemoteDataSourceImpl implements HomeInformationRemoteDataSource {
  HomeInformationRemoteDataSourceImpl(this._dio);
  final Dio _dio;
  @override
  Future<HomeInformationModel> getHomeInformation() async {
    try {
      final res = await _dio.get('/home_info');
      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        final homeInfoModel = HomeInformationModel.fromJson(data);
        return homeInfoModel;
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
}
