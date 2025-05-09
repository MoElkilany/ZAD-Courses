import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/student_assignments_list.dart';
import '../entities/teacher_assignments_list.dart';
import '../repositories/assignments_repository.dart';

/// A use case that retrieves a list of assignments for a student.
class GetStudentAssignments extends UseCase<StudentAssignmentsList, NoParameters> {
  final AssignmentsRepository repository;

  /// Constructor for the [GetStudentAssignments] use case.
  ///
  /// [repository] is a required parameter of type [AssignmentsRepository].
  GetStudentAssignments({
    required this.repository,
  });

  /// Calls the [getStudentAssignments] method from the [repository] to retrieve a list of assignments for a student.
  /// Returns a [Future] of [Either] [Failure] or [StudentAssignmentsList].
  @override
  Future<Either<Failure, StudentAssignmentsList>> call(NoParameters params) async {
    return await repository.getStudentAssignments();
  }
}

/// A use case that retrieves a list of assignments for a teacher.
class GetTeacherAssignments extends UseCase<TeacherAssignmentsList, NoParameters> {
  final AssignmentsRepository repository;

  /// Constructor for the [GetTeacherAssignments] use case.
  ///
  /// [repository] is a required parameter of type [AssignmentsRepository].
  GetTeacherAssignments({
    required this.repository,
  });

  /// Calls the [getTeacherAssignments] method from the [repository] to retrieve a list of assignments for a teacher.
  /// Returns a [Future] of [Either] [Failure] or [TeacherAssignmentsList].
  @override
  Future<Either<Failure, TeacherAssignmentsList>> call(NoParameters params) async {
    return await repository.getTeacherAssignments();
  }
}
