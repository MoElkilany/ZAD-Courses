import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../di/external_services.dart';
import '../../domain/entities/progress_req.dart';
import '../models/filters_model.dart';
import '../models/progress_model.dart';

abstract class ProgressRemoteDataSource {
  Future<ProgressModel> getProgresss(ProgressReq req);
  Future<FiltersModel> getFilters();
}

final quizzesRemoteDataSource = Provider<ProgressRemoteDataSource>((ref) {
  final dio = ref.read(ExternalServices.dio);
  return ProgressRemoteDataSourceImpl(dio);
});

class ProgressRemoteDataSourceImpl implements ProgressRemoteDataSource {
  ProgressRemoteDataSourceImpl(this._dio);
  final Dio _dio;

  @override
  Future<ProgressModel> getProgresss(ProgressReq req) async {
    try {
      final res = await _dio.get(
        Endpoints.progress,
        queryParameters: {
          'course_id': req.course.courseId,
          'student_id': req.student.studentId,
        },
      );
      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        if (data['success'] == false) {
          throw ServerException(status: 404, message: "endpoint not found");
        }
        final model = ProgressModel.fromJson(data['data']);

        return model;
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
  Future<FiltersModel> getFilters() async {
    try {
      final res = await _dio.get(Endpoints.progressFilters);
      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        if (data['success'] == false) {
          throw ServerException(status: 404, message: "endpoint not found");
        }
        final model = FiltersModel.fromJson(data['data']);

        return model;
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
