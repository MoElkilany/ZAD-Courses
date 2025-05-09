import 'package:dartz/dartz.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failures.dart';
import '../../../../di/quizzes.dart';
import '../../domain/entities/student/quiz_not_submitted.dart';
import '../../domain/entities/student/quiz_result.dart';
import '../../domain/entities/student/quiz_results_list.dart';
import '../../domain/entities/teacher/quiz_list_teacher.dart';
import '../../domain/entities/teacher/quiz_teacher.dart';
import 'student/quizzes_manager_student.dart';
import 'teacher/quizzes_manager_student.dart';

part 'quizzes.g.dart';

@riverpod
Future<Either<Failure, QuizResultsList>> getStudentQuizResults(
  Ref ref,
) async {
  final getQuizResults = ref.read(QuizzesDI.quizzesRepository);
  final res = await getQuizResults.getStudentQuizResults();
  if (res.isRight()) {
    final list = res.fold((l) => <QuizResult>[], (r) => r.results);
    //sort by date
    list.sort((a, b) {
      if (a.submissionDate == null || b.submissionDate == null) {
        return 1;
      }
      return b.submissionDate!.compareTo(a.submissionDate!);
    });
    ref.read(studentResultsListManagerProvider.notifier).setAllQuizzes(list);
    ref.read(studentResultsListManagerProvider.notifier).initFilteredQuizzes();
  }
  return res;
}

@riverpod
Future<Either<Failure, List<QuizNotSubmitted>>> getStudentQuizzesNotSubmitted(
  Ref ref,
) async {
  final getQuizResults = ref.read(QuizzesDI.quizzesRepository);
  final res = await getQuizResults.getStudentQuizzesNotSubmitted();
  if (res.isRight()) {
    final list = res.fold((l) => <QuizNotSubmitted>[], (r) => r);
    //sort by date
    list.sort((a, b) {
      if (a.dueDate == null || b.dueDate == null) {
        return 1;
      }
      return b.dueDate!.compareTo(a.dueDate!);
    });
    ref.read(studentNotSubmittedListManagerProvider.notifier).setAllQuizzes(list);
    ref.read(studentNotSubmittedListManagerProvider.notifier).initFilteredQuizzes();
  }
  return res;
}

@riverpod
Future<Either<Failure, QuizzesListTeacher>> getTeacherQuizResults(
  Ref ref,
) async {
  final getQuizResults = ref.read(QuizzesDI.quizzesRepository);
  final res = await getQuizResults.getTeacherQuizzes();
  if (res.isRight()) {
    final list = res.fold((l) => <QuizTeacher>[], (r) => r.quizzesList);
    //sort by date
    list.sort((a, b) {
      return b.dateCreated.compareTo(a.dateCreated);
    });
    ref.read(teacherQuizListManagerProvider.notifier).setAllQuizzes(list);
    ref.read(teacherQuizListManagerProvider.notifier).initFilteredQuizzes();
  }

  return res;
}
