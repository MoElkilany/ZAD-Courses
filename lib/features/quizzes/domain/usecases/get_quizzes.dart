import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/student/quiz_not_submitted.dart';
import '../entities/student/quiz_results_list.dart';
import '../entities/teacher/quiz_list_teacher.dart';
import '../repositories/quizzes_repository.dart';

class GetStudentQuizResults extends UseCase<QuizResultsList, NoParameters> {
  final QuizzesRepository repository;

  GetStudentQuizResults({
    required this.repository,
  });

  @override
  Future<Either<Failure, QuizResultsList>> call(NoParameters params) async {
    return await repository.getStudentQuizResults();
  }
}

class GetStudentQuizzesNotSubmitted extends UseCase<List<QuizNotSubmitted>, NoParameters> {
  final QuizzesRepository repository;

  GetStudentQuizzesNotSubmitted({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<QuizNotSubmitted>>> call(NoParameters params) async {
    return await repository.getStudentQuizzesNotSubmitted();
  }
}

class GetTeacherQuizzes extends UseCase<QuizzesListTeacher, NoParameters> {
  final QuizzesRepository repository;

  GetTeacherQuizzes({
    required this.repository,
  });

  @override
  Future<Either<Failure, QuizzesListTeacher>> call(NoParameters params) async {
    return await repository.getTeacherQuizzes();
  }
}
