import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../data_sources/quizzes_remote_data_source.dart';
import '../../domain/entities/student/quiz_not_submitted.dart';
import '../../domain/entities/student/quiz_results_list.dart';
import '../../domain/entities/teacher/quiz_list_teacher.dart';
import '../../domain/repositories/quizzes_repository.dart';

class QuizzesRepositoryImpl implements QuizzesRepository {
  final QuizzesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  QuizzesRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, QuizResultsList>> getStudentQuizResults() async {
    if (networkInfo.isConnected) {
      try {
        final remoteQuizResults = await remoteDataSource.getQuizResults();
        // await localDataSource.cacheCourses(courseId, emoteCourse);
        return Right(remoteQuizResults);
      } on ServerException {
        return Left(ServerFailure(
          status: 500,
          message: 'errors.serverError'.tr(),
        ));
      }
    } else {
      return Left(ServerFailure(
        status: 500,
        message: 'errors.serverError'.tr(),
      ));
    }
  }

  @override
  Future<Either<Failure, List<QuizNotSubmitted>>> getStudentQuizzesNotSubmitted() async {
    if (networkInfo.isConnected) {
      try {
        final remoteQuizzesNotSubmitted = await remoteDataSource.getQuizzesNotSubmitted();
        // await localDataSource.cacheCourses(courseId, emoteCourse);
        return Right(remoteQuizzesNotSubmitted);
      } on ServerException {
        return Left(ServerFailure(
          status: 500,
          message: 'errors.serverError'.tr(),
        ));
      }
    } else {
      return Left(ServerFailure(
        status: 500,
        message: 'errors.serverError'.tr(),
      ));
    }
  }

  @override
  Future<Either<Failure, QuizzesListTeacher>> getTeacherQuizzes() async {
    if (networkInfo.isConnected) {
      try {
        final teacherQuizzes = await remoteDataSource.getQuizzesTeacher();
        // await localDataSource.cacheCourses(courseId, emoteCourse);
        return Right(teacherQuizzes);
      } on ServerException {
        return Left(ServerFailure(
          status: 500,
          message: 'errors.serverError'.tr(),
        ));
      }
    } else {
      return Left(ServerFailure(
        status: 500,
        message: 'errors.serverError'.tr(),
      ));
    }
  }
}
