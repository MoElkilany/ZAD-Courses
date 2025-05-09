import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/student_assignments_list.dart';
import '../entities/student_submissions.dart';
import '../entities/teacher_assignments_list.dart';

/// This abstract class defines the contract for the repository that handles
/// assignments related data.
abstract class AssignmentsRepository {
  /// Retrieves a list of assignments for a given student.
  ///
  /// Returns a [Future] that resolves to an [Either] object containing either
  /// a [Failure] object in case of an error or a [StudentAssignmentsList] object
  /// if the operation was successful.
  Future<Either<Failure, StudentAssignmentsList>> getStudentAssignments();

  /// Retrieves a list of assignments for a given teacher.
  ///
  /// Returns a [Future] that resolves to an [Either] object containing either
  /// a [Failure] object in case of an error or a [TeacherAssignmentsList] object
  /// if the operation was successful.
  Future<Either<Failure, TeacherAssignmentsList>> getTeacherAssignments();

  /// Retrieves a list of submissions for a given assignment.
  ///
  /// Returns a [Future] that resolves to an [Either] object containing either
  /// a [Failure] object in case of an error or a [StudentSubmission] object
  /// if the operation was successful.
  Future<Either<Failure, List<StudentSubmission>>> getStudentSubmission(int assignmentId);
}
