import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/course.dart';
import '../entities/favourited.dart';
import '../entities/purchase.dart';
import '../entities/session_details.dart';

/// This abstract class represents the contract for the CourseRepository.
/// It defines the methods that must be implemented by any concrete CourseRepository.
abstract class CourseRepository {
  /// This method retrieves a course by its ID and the user ID.
  ///
  /// If the operation is successful, it returns a [Right] containing the [Course] object.
  /// If the operation fails, it returns a [Left] containing a [Failure] object.
  ///
  /// Throws a [ServerException] for any server-related errors.
  Future<Either<Failure, Course>> getCourse(int courseId);

  /// This method retrieves a list of courses That a certain user has purchased.
  /// No need for id as access token is enough.
  ///
  /// If the operation is successful, it returns a [Right] containing the list of [PurchasedCourse] objects.
  /// If the operation fails, it returns a [Left] containing a [Failure] object.
  ///
  /// Throws a [ServerException] for any server-related errors.
  Future<Either<Failure, List<PurchasedCourse>>> getPurchasedCourses();

  /// This method retrieves a list of courses That a certain user has Favourited.
  /// No need for id as access token is enough.
  ///
  /// If the operation is successful, it returns a [Right] containing the list of [FavouritedCourse] objects.
  /// If the operation fails, it returns a [Left] containing a [Failure] object.
  ///
  /// Throws a [ServerException] for any server-related errors.
  Future<Either<Failure, List<FavouritedCourse>>> getFavouritedCourses();

  /// This method adds or removes a course from the user's favourite courses list.
  /// It takes a [courseId].
  ///
  /// If the operation is successful, it returns a [Right] containing the [Course] object.
  /// If the operation fails, it returns a [Left] containing a [Failure] object.
  ///
  /// Throws a [ServerException] for any server-related errors.
  Future<Either<Failure, void>> toggleFavourite(int courseId);

  /// This method fetchs the [SessionDetails] of a selected [sessionId].
  ///
  /// If the operation is successful, it returns a [Right] containing the [SessionDetails] object.
  /// If the operation fails, it returns a [Left] containing a [Failure] object.
  ///
  /// Throws a [ServerException] for any server-related errors.
  Future<Either<Failure, String>> getSessionDetails(int sessionId);
}
