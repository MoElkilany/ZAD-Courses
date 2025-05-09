import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../di/external_services.dart';
import '../../domain/entities/evaluation.dart';
import '../models/evaluation_data_model.dart';
import '../models/evaluation_details_model.dart';

abstract class MonthlyEvaluationRemoteDataSource {
  Future<EvaluationDataModel> getEvaluations();
  Future<EvaluationDetailsModel> getEvaluationDetails(MonthlyEvaluation e);
}

final quizzesRemoteDataSource = Provider<MonthlyEvaluationRemoteDataSource>((ref) {
  final dio = ref.read(ExternalServices.dio);
  return MonthlyEvaluationRemoteDataSourceImpl(dio);
});

class MonthlyEvaluationRemoteDataSourceImpl implements MonthlyEvaluationRemoteDataSource {
  MonthlyEvaluationRemoteDataSourceImpl(this._dio);
  final Dio _dio;

  @override
  Future<EvaluationDataModel> getEvaluations() async {
    try {
      final res = await _dio.get(Endpoints.evaluations);
      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        if (data['success'] == false) {
          throw ServerException(status: 404, message: "endpoint not found");
        }
        final model = EvaluationDataModel.fromJson(data['data']);

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
  Future<EvaluationDetailsModel> getEvaluationDetails(MonthlyEvaluation e) async {
    try {
      final res = await _dio.get('${Endpoints.evaluations}/${e.id}');
      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        if (data['success'] == false) {
          throw ServerException(status: 404, message: "endpoint not found");
        }
        final evaluation = EvaluationDetailsModel.fromJson(data['data']);
        return evaluation;
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
