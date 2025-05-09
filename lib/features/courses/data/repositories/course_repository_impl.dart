import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../data_sources/course_local_data_source.dart';
import '../data_sources/course_remote_data_source.dart';
import '../../domain/entities/course.dart';
import '../../domain/entities/favourited.dart';
import '../../domain/entities/purchase.dart';
import '../../domain/repositories/course_repository.dart';

/// A concrete implementation of [CourseRepository] interface.
class CourseRepositoryImpl implements CourseRepository {
  final CourseRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final CourseLocalDataSource localDataSource;

  /// Constructs a [CourseRepositoryImpl] instance.
  ///
  /// [remoteDataSource] is a required parameter of type [CourseRemoteDataSource].
  /// [networkInfo] is a required parameter of type [NetworkInfo].
  /// [localDataSource] is a required parameter of type [CourseLocalDataSource].
  CourseRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.localDataSource,
  });

  /// Returns a [Course] object wrapped in an [Either] object.
  ///
  /// [courseId] is a required parameter of type [int] representing the id of the course.
  /// [userId] is a required parameter of type [int] representing the id of the user.
  ///
  /// If the device is connected to the internet, the method tries to fetch the course from the remote data source.
  /// If the fetch is successful, the course is returned wrapped in a [Right] object.
  /// If the fetch fails, a [ServerFailure] object is returned wrapped in a [Left] object.
  ///
  /// If the device is not connected to the internet, the method tries to fetch the course from the local data source.
  /// If the fetch is successful, the course is returned wrapped in a [Right] object.
  /// If the fetch fails, a [CacheFailure] object is returned wrapped in a [Left] object.
  @override
  Future<Either<Failure, Course>> getCourse(int courseId) async {
    if (networkInfo.isConnected) {
      try {
        final remoteCourse = await remoteDataSource.getCourse(courseId);
        // await localDataSource.cacheCourses(courseId, remoteCourse);
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

  /// Returns a list of [PurchasedCourse] objects wrapped in an [Either] object.
  ///
  /// If the device is connected to the internet, the method tries to fetch the course from the remote data source.
  /// If the fetch is successful, the course is returned wrapped in a [Right] object.
  /// If the fetch fails, a [ServerFailure] object is returned wrapped in a [Left] object.
  ///
  /// If the device is not connected to the internet, the method tries to fetch the course from the local data source.
  /// If the fetch is successful, the course is returned wrapped in a [Right] object.
  /// If the fetch fails, a [CacheFailure] object is returned wrapped in a [Left] object.
  @override
  Future<Either<Failure, List<PurchasedCourse>>> getPurchasedCourses() async {
    if (networkInfo.isConnected) {
      try {
        final remoteCourses = await remoteDataSource.getPurchasedCourses();
        // await localDataSource.cacheCourses(courseId, remoteCourse);
        return Right(remoteCourses);
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

  /// Returns a list of [FavouritedCourse] objects wrapped in an [Either] object.
  ///
  /// If the device is connected to the internet, the method tries to fetch the course from the remote data source.
  /// If the fetch is successful, the course is returned wrapped in a [Right] object.
  /// If the fetch fails, a [ServerFailure] object is returned wrapped in a [Left] object.
  ///
  /// If the device is not connected to the internet, the method tries to fetch the course from the local data source.
  /// If the fetch is successful, the course is returned wrapped in a [Right] object.
  /// If the fetch fails, a [CacheFailure] object is returned wrapped in a [Left] object.
  @override
  Future<Either<Failure, List<FavouritedCourse>>> getFavouritedCourses() async {
    if (networkInfo.isConnected) {
      try {
        final remoteCourses = await remoteDataSource.getFavouritedCourses();
        // await localDataSource.cacheCourses(courseId, remoteCourse);
        return Right(remoteCourses);
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

  /// Returns a [PurchasedCourse] object wrapped in an [Either] object.
  ///
  /// If the device is connected to the internet, the method tries to fetch the course from the remote data source.
  /// If the fetch is successful, the course is returned wrapped in a [Right] object.
  /// If the fetch fails, a [ServerFailure] object is returned wrapped in a [Left] object.
  ///
  /// If the device is not connected to the internet, the method tries to fetch the course from the local data source.
  /// If the fetch is successful, the course is returned wrapped in a [Right] object.
  /// If the fetch fails, a [CacheFailure] object is returned wrapped in a [Left] object.
  @override
  Future<Either<Failure, void>> toggleFavourite(int courseId) async {
    if (networkInfo.isConnected) {
      try {
        final wasToggled = await remoteDataSource.toggleFavourite(courseId);
        //if status is 200 then revalidate the purchased courses
        if (wasToggled) {
          return const Right(null);
        }
        // await localDataSource.cacheCourses(courseId, remoteCourse);
        return Left(ServerFailure(
          status: 500,
          message: 'errors.serverError'.tr(),
        ));
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

  /// Returns a [PurchasedCourse] object wrapped in an [Either] object.
  ///
  /// If the device is connected to the internet, the method tries to fetch the course from the remote data source.
  /// If the fetch is successful, the course is returned wrapped in a [Right] object.
  /// If the fetch fails, a [ServerFailure] object is returned wrapped in a [Left] object.
  ///
  /// If the device is not connected to the internet, the method tries to fetch the course from the local data source.
  /// If the fetch is successful, the course is returned wrapped in a [Right] object.
  /// If the fetch fails, a [CacheFailure] object is returned wrapped in a [Left] object.
  @override
  Future<Either<Failure, String>> getSessionDetails(int sessionId) async {
    if (networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.getSessionDetails(sessionId);
        return Right(res);
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
