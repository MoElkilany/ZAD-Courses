import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failures.dart';
import '../../../../di/assignments.dart';
import '../../domain/entities/student_assignments_list.dart';
import '../../domain/entities/student_submissions.dart';
import '../../domain/entities/teacher_assignments_list.dart';
import 'assignment_details.dart';
import 'assignment_lists_manager.dart';
import 'assignment_lists_manager_teacher.dart';

part 'assignments.g.dart';

@Riverpod(keepAlive: true)
Future<Either<Failure, StudentAssignmentsList>> getStudentAssignments(
  Ref ref,
) async {
  final getAssignments = ref.read(AssignmentsDI.assignmentsRepository);
  final res = await getAssignments.getStudentAssignments();
  if (res.isRight()) {
    final asgs = res.getOrElse(() => throw Exception()).assignments;

    ref.watch(studentAssignmentsListManagerProvider.notifier).setAllAssignments(asgs);
    ref.watch(studentAssignmentsListManagerProvider.notifier).initFilteredAssignments(asgs);
  }
  return res;
}

@riverpod
Future<Either<Failure, TeacherAssignmentsList>> getTeacherAssignments(
  GetTeacherAssignmentsRef ref,
) async {
  final getAssignments = ref.read(AssignmentsDI.assignmentsRepository);
  final res = await getAssignments.getTeacherAssignments();
  if (res.isRight()) {
    final asgs = res.getOrElse(() => throw Exception()).assignments;
    ref.watch(teacherAssignmentsListManagerProvider.notifier).setAllAssignments(asgs);
    ref.watch(teacherAssignmentsListManagerProvider.notifier).initFilteredAssignments(asgs);
  }
  return res;
}

@riverpod
Future<Either<Failure, List<StudentSubmission>>> getStudentSubmissions(
  GetStudentSubmissionsRef ref,
) async {
  final id = ref.read(studentsAssignmentSubmissionsDetailsProvider);
  if (id == null) {
    return Left(ServerFailure(
      status: 500,
      message: 'errors.serverError'.tr(),
    ));
  }
  final getAssignments = ref.read(AssignmentsDI.assignmentsRepository);
  final res = await getAssignments.getStudentSubmission(id);

  return res;
}
