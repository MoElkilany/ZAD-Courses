import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../core/config/endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../di/external_services.dart';
import '../models/student_assignments_list_model.dart';
import '../models/student_submissions_model.dart';
import '../models/teacher_assignments_list_model.dart';

/// An abstract class that defines the methods for retrieving assignments data from a remote data source.
abstract class AssignmentsRemoteDataSource {
  /// Throws a [ServerException] if the server returns an error status code.
  ///
  /// Returns a [Future] that completes with a [StudentAssignmentsListModel] object.
  Future<StudentAssignmentsListModel> getStudentAssignments();

  /// Throws a [ServerException] if the server returns an error status code.
  ///
  /// Returns a [Future] that completes with a [TeacherAssignmentsListModel] object.
  Future<TeacherAssignmentsListModel> getTeacherAssignments();

  /// Throws a [ServerException] if the server returns an error status code.
  ///
  /// Returns a [Future] that completes with a [StudentSubmissionModel] object.
  Future<List<StudentSubmissionsModel>> getStudentSubmission(int assignmentId);
}

final assignmentsRemoteDataSource = Provider<AssignmentsRemoteDataSource>((ref) {
  final dio = ref.read(ExternalServices.dio);
  return AssignmentsRemoteDataSourceImpl(dio);
});

/// A class that implements the [AssignmentsRemoteDataSource] abstract class.
/// It defines the methods for retrieving assignments data from a remote data source.
class AssignmentsRemoteDataSourceImpl implements AssignmentsRemoteDataSource {
  AssignmentsRemoteDataSourceImpl(this._dio);
  final Dio _dio;

  /// Throws a [ServerException] if the server returns an error status code.
  ///
  /// Returns a [Future] that completes with a [StudentAssignmentsListModel] object.
  @override
  Future<StudentAssignmentsListModel> getStudentAssignments() async {
    try {
      final res = await _dio.get(Endpoints.studentAssignments);
      // log('getStudentAssignments, ${res.data.toString()}');
      // return AssignmentMocks.mStudentAssignments;
      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        if (data['success'] == false) {
          throw ServerException(status: 404, message: "endpoint not found");
        }
        final assignmentsModel = StudentAssignmentsListModel.fromJson(data['data']);
        // log('assignmentsModel: $assignmentsModel');
        return assignmentsModel;
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

  /// Throws a [ServerException] if the server returns an error status code.
  ///
  /// Returns a [Future] that completes with a [TeacherAssignmentsListModel] object.
  @override
  Future<TeacherAssignmentsListModel> getTeacherAssignments() async {
    try {
      final res = await _dio.get(Endpoints.teacherAssignments);

      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        final assignmentsModel = TeacherAssignmentsListModel.fromJson(data['data']);
        return assignmentsModel;
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

  /// Throws a [ServerException] if the server returns an error status code.
  ///
  /// Returns a [Future] that completes with a [TeacherAssignmentsListModel] object.
  @override
  Future<List<StudentSubmissionsModel>> getStudentSubmission(int studentId) async {
    try {
      final res = await _dio.get('${Endpoints.studentSubmissionsPrefix}$studentId${Endpoints.studentSubmissionsSuffix}');

      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        final assignmentsModel = data['data'].map<StudentSubmissionsModel>((e) => StudentSubmissionsModel.fromJson(e)).toList();
        return assignmentsModel;
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
