import 'package:hive/hive.dart';
import '../../../../core/error/exceptions.dart';
import '../models/student_assignments_list_model.dart';
import '../models/teacher_assignments_list_model.dart';
import '../../domain/entities/student_assignments_list.dart';
import '../../domain/entities/teacher_assignments_list.dart';

/// An abstract class that defines the local data source methods for assignments.
abstract class AssignmentsLocalDataSource {
  /// Retrieves the student assignments for the given [userId].
  ///
  /// Throws a [CacheException] if there is no cached data.
  Future<StudentAssignmentsList> getStudentAssignments(int userId);

  /// Caches the student assignments for the given [courseId].
  ///
  /// Returns a [Future] that completes when the data is cached.
  Future<void> cacheStudentAssignments(
    int courseId,
    StudentAssignmentsList assignments,
  );

  /// Retrieves the teacher assignments for the given [userId].
  ///
  /// Throws a [CacheException] if there is no cached data.
  Future<TeacherAssignmentsList> getTeacherAssignments(int userId);

  /// Caches the teacher assignments for the given [userId].
  ///
  /// Returns a [Future] that completes when the data is cached.
  Future<void> cacheTeacherAssignments(
    int userId,
    TeacherAssignmentsList assignments,
  );
}

/// A concrete implementation of the [AssignmentsLocalDataSource] abstract class.
class AssignmentsLocalDataSourceImpl implements AssignmentsLocalDataSource {
  static String assignmentsBoxName = 'assignments_box';
  static const tokenName = 'assignments_user_id_';

  final Box assignmentsBox;

  AssignmentsLocalDataSourceImpl(
    this.assignmentsBox,
  );

  /// Retrieves the student assignments for the given [userId].
  ///
  /// Throws a [CacheException] if there is no cached data.
  @override
  Future<StudentAssignmentsList> getStudentAssignments(int userId) async {
    final fullToken = tokenName + userId.toString();
    final Map<String, dynamic>? assignments = await assignmentsBox.get(fullToken) as Map<String, dynamic>?;
    if (assignments != null) {
      return StudentAssignmentsListModel.fromJson(assignments);
    } else {
      throw CacheException(status: 500, message: 'Cache Error');
    }
  }

  /// Caches the student assignments for the given [courseId].
  ///
  /// Returns a [Future] that completes when the data is cached.
  @override
  Future<void> cacheStudentAssignments(int courseId, StudentAssignmentsList assignments) async {
    final fullToken = tokenName + courseId.toString();
    final assignmentsModel = StudentAssignmentsListModel(
      assignments: assignments.assignments,
      numActive: assignments.numActive,
      numSubmitted: assignments.numSubmitted,
      // numPending: assignments.numPending,
      // numPassed: assignments.numPassed,
      // numFailed: assignments.numFailed,
      // numExpired: assignments.numExpired,
      numAssignments: assignments.numAssignments,
    );
    final assignmentsString = assignmentsModel.toJson();
    return await assignmentsBox.put(fullToken, assignmentsString);
  }

  /// Retrieves the teacher assignments for the given [userId].
  ///
  /// Throws a [CacheException] if there is no cached data.
  @override
  Future<TeacherAssignmentsList> getTeacherAssignments(int userId) async {
    final fullToken = tokenName + userId.toString();
    final Map<String, dynamic>? assignments = await assignmentsBox.get(fullToken) as Map<String, dynamic>?;
    if (assignments != null) {
      return TeacherAssignmentsListModel.fromJson(assignments);
    } else {
      throw CacheException(status: 500, message: 'Cache Error');
    }
  }

  /// Caches the teacher assignments for the given [userId].
  ///
  /// Returns a [Future] that completes when the data is cached.
  @override
  Future<void> cacheTeacherAssignments(int userId, TeacherAssignmentsList assignments) async {
    final fullToken = tokenName + userId.toString();
    final assignmentsModel = TeacherAssignmentsListModel(
      assignments: assignments.assignments,
      numActive: assignments.numActive,
      numAssignments: assignments.numAssignments,
      numExpired: assignments.numExpired,
      numSubmitted: assignments.numSubmitted,
    );
    final assignmentsString = assignmentsModel.toJson();
    return await assignmentsBox.put(fullToken, assignmentsString);
  }
}
