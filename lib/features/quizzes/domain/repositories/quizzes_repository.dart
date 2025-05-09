import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/student/quiz_not_submitted.dart';
import '../entities/student/quiz_results_list.dart';
import '../entities/teacher/quiz_list_teacher.dart';

abstract class QuizzesRepository {
  //student
  Future<Either<Failure, QuizResultsList>> getStudentQuizResults();
  Future<Either<Failure, List<QuizNotSubmitted>>> getStudentQuizzesNotSubmitted();

  //teacher
  Future<Either<Failure, QuizzesListTeacher>> getTeacherQuizzes();
}
