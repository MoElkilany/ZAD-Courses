import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import '../../../../core/config/endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../di/external_services.dart';
import '../models/student/quiz_not_submitted_model.dart';
import '../models/student/quiz_result_list_model.dart';
import '../models/teacher/quiz_list_teacher_model.dart';
import '../../domain/entities/student/quiz_not_submitted.dart';
import '../../domain/entities/student/quiz_results_list.dart';
import '../../domain/entities/teacher/quiz_list_teacher.dart';

abstract class QuizzesRemoteDataSource {
  //student
  Future<QuizResultsList> getQuizResults();
  Future<List<QuizNotSubmitted>> getQuizzesNotSubmitted();

  //teacher
  Future<QuizzesListTeacher> getQuizzesTeacher();
}

final quizzesRemoteDataSource = Provider<QuizzesRemoteDataSource>((ref) {
  final dio = ref.read(ExternalServices.dio);
  return QuizzesRemoteDataSourceImpl(dio);
});

class QuizzesRemoteDataSourceImpl implements QuizzesRemoteDataSource {
  QuizzesRemoteDataSourceImpl(this._dio);
  final Dio _dio;

  @override
  Future<QuizResultsList> getQuizResults() async {
    try {
      final res = await _dio.get(Endpoints.studentQuizResults);
      // log('getStudentAssignments, ${res.data.toString()}');
      // return AssignmentMocks.mStudentAssignments;
      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        if (data['success'] == false) {
          throw ServerException(status: 404, message: "endpoint not found");
        }
        final quizzesModel = QuizResultListModel.fromJson(data['data']);

        return quizzesModel;
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
  Future<List<QuizNotSubmitted>> getQuizzesNotSubmitted() async {
    try {
      final res = await _dio.get(Endpoints.studentQuizzesNotSubmitted);
      // log('getStudentAssignments, ${res.data.toString()}');
      // return AssignmentMocks.mStudentAssignments;
      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        if (data['success'] == false) {
          throw ServerException(status: 404, message: "endpoint not found");
        }
        final quizzesModel = data['data']['quizzes'] as List<dynamic>;
        return quizzesModel.map((e) => QuizNotSubmittedModel.fromJson(e)).toList();
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
  Future<QuizzesListTeacher> getQuizzesTeacher() async {
    try {
      final res = await _dio.get(Endpoints.teacherQuizzes);
      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        if (data['success'] == false) {
          throw ServerException(status: 404, message: "endpoint not found");
        }
        return QuizListTeacherModel.fromJson(data['data']);
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
