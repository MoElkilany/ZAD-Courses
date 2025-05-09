import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../data_sources/assignments_local_data_source.dart';
import '../data_sources/assignments_remote_data_source.dart';
import '../../domain/entities/student_assignments_list.dart';
import '../../domain/entities/student_submissions.dart';
import '../../domain/entities/teacher_assignments_list.dart';
import '../../domain/repositories/assignments_repository.dart';

/// A concrete implementation of [AssignmentsRepository] interface.
class AssignmentsRepositoryImpl implements AssignmentsRepository {
  final AssignmentsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final AssignmentsLocalDataSource localDataSource;

  AssignmentsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.localDataSource,
  });

  /// Returns a [StudentAssignmentsList] for the given [userId].
  ///
  /// Throws a [ServerException] for all error codes.
  ///
  /// Returns a [ServerFailure] for all error codes.
  ///
  /// Returns a [CacheFailure] for all cache errors.
  @override
  Future<Either<Failure, StudentAssignmentsList>> getStudentAssignments() async {
    if (networkInfo.isConnected) {
      try {
        final remoteCourse = await remoteDataSource.getStudentAssignments();
        // await localDataSource.cacheCourses(courseId, emoteCourse);
        return Right(remoteCourse);
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
      // try {
      //   final localCourse = await localDataSource.getCourses(courseId);
      //   return Right(localCourse);
      // } on CacheException {
      //   return const Left(CacheFailure(
      //     status: 500,
      //     message: 'Cache Error',
      //   ));
      // }
    }
  }

  /// Returns a [TeacherAssignmentsList] for the given [userId].
  ///
  /// Throws a [ServerException] for all error codes.
  ///
  /// Returns a [ServerFailure] for all error codes.
  ///
  /// Returns a [CacheFailure] for all cache errors.
  @override
  Future<Either<Failure, TeacherAssignmentsList>> getTeacherAssignments() async {
    if (networkInfo.isConnected) {
      try {
        final remoteassignments = await remoteDataSource.getTeacherAssignments();
        // await localDataSource.cacheCourses(courseId, emoteCourse);
        return Right(remoteassignments);
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
      // try {
      //   final localCourse = await localDataSource.getCourses(courseId);
      //   return Right(localCourse);
      // } on CacheException {
      //   return const Left(CacheFailure(
      //     status: 500,
      //     message: 'Cache Error',
      //   ));
      // }
    }
  }

  /// Returns a [StudendSubmission] for the given [userId].
  ///
  /// Throws a [ServerException] for all error codes.
  ///
  /// Returns a [ServerFailure] for all error codes.
  ///
  /// Returns a [CacheFailure] for all cache errors.
  @override
  Future<Either<Failure, List<StudentSubmission>>> getStudentSubmission(int userId) async {
    if (networkInfo.isConnected) {
      try {
        final remoteassignments = await remoteDataSource.getStudentSubmission(userId);
        // await localDataSource.cacheCourses(courseId, emoteCourse);
        return Right(remoteassignments);
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
      // try {
      //   final localCourse = await localDataSource.getCourses(courseId);
      //   return Right(localCourse);
      // } on CacheException {
      //   return const Left(CacheFailure(
      //     status: 500,
      //     message: 'Cache Error',
      //   ));
      // }
    }
  }
}
