import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../di/external_services.dart';
import '../models/financial_data_student_model.dart';
import '../models/financial_data_teacher_model.dart';
import '../../domain/entities/financial_data_student.dart';
import '../../domain/entities/financial_data_teacher.dart';

abstract class FinancialRemoteDataSource {
  //student
  Future<FinancialDataStudent> getFinancialDataStudent();
  //teacher
  Future<FinancialDataTeacher> getFinancialDataTeacher();
}

final quizzesRemoteDataSource = Provider<FinancialRemoteDataSource>((ref) {
  final dio = ref.read(ExternalServices.dio);
  return FinancialRemoteDataSourceImpl(dio);
});

class FinancialRemoteDataSourceImpl implements FinancialRemoteDataSource {
  FinancialRemoteDataSourceImpl(this._dio);
  final Dio _dio;

  @override
  Future<FinancialDataStudent> getFinancialDataStudent() async {
    try {
      final res = await _dio.get(Endpoints.financialSummary);
      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        if (data['success'] == false) {
          throw ServerException(status: 404, message: "endpoint not found");
        }
        final financialModel = FinancialDataStudentModel.fromJson(data['data']);

        return financialModel;
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
  Future<FinancialDataTeacher> getFinancialDataTeacher() async {
    try {
      final res = await _dio.get(Endpoints.financialSummary);
      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        if (data['success'] == false) {
          throw ServerException(status: 404, message: "endpoint not found");
        }
        final financialModel = FinancialDataTeacherModel.fromJson(data['data']);

        return financialModel;
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
