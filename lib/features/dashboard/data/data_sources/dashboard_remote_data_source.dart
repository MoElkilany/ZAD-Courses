import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../di/external_services.dart';
import '../../domain/entities/dashboard_data_parent.dart';
import '../../domain/entities/dashboard_data_student.dart';
import '../../domain/entities/dashboard_data_teacher.dart';
import '../models/dashboard_data_parent_model.dart';
import '../models/dashboard_data_student_model.dart';
import '../models/dashboard_data_teacher_model.dart';

abstract class DashboardRemoteDataSource {
  /// student
  Future<DashboardDataStudent> getDashboardDataStudent();

  /// teacher
  Future<DashboardDataTeacher> getDashboardDataTeacher();

  /// parent data
  Future<DashboardDataParent> getDashboardDataParent();
}

final quizzesRemoteDataSource = Provider<DashboardRemoteDataSource>((ref) {
  final dio = ref.read(ExternalServices.dio);
  return DashboardRemoteDataSourceImpl(dio);
});

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  DashboardRemoteDataSourceImpl(this._dio);
  final Dio _dio;

  @override
  Future<DashboardDataStudent> getDashboardDataStudent() async {
    try {
      final res = await _dio.get(Endpoints.dashboard);
      log(res.requestOptions.headers['Authorization']);
      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        if (data['success'] == false) {
          throw ServerException(status: 404, message: "endpoint not found");
        }
        final dashboardModel = DashboardDataStudentModel.fromJson(data['data']);

        return dashboardModel;
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
  Future<DashboardDataTeacher> getDashboardDataTeacher() async {
    try {
      final res = await _dio.get(Endpoints.dashboard);
      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        if (data['success'] == false) {
          throw ServerException(status: 404, message: "endpoint not found");
        }
        final dashboardModel = DashboardDataTeacherModel.fromJson(data['data']);

        return dashboardModel;
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
  Future<DashboardDataParent> getDashboardDataParent() async {
    try {
      final res = await _dio.get(Endpoints.dashboard);
      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        if (data['success'] == false) {
          throw ServerException(status: 404, message: "endpoint not found");
        }
        final dashboardModel = DashboardDataParentModel.fromJson(data['data']);

        return dashboardModel;
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
