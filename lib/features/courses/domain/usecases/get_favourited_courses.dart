import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/favourited.dart';
import '../entities/purchase.dart';
import '../repositories/course_repository.dart';

/// A use case that retrieves a a list of [FavouritedCourse] from the [CourseRepository] based on the access token of the user.
class GetFavouritedCourses extends UseCase<List<FavouritedCourse>, NoParameters> {
  final CourseRepository repository;

  /// Constructor that takes a [CourseRepository] as a parameter.
  GetFavouritedCourses({
    required this.repository,
  });

  /// Calls the [CourseRepository.getFavouritedCourses] method and returns the result as an [Either] object.
  ///
  /// If the operation is successful, the [Either] object contains the retrieved list of [PurchasedCourse] objects.
  /// If the operation fails, the [Either] object contains a [Failure] object.
  @override
  Future<Either<Failure, List<FavouritedCourse>>> call(NoParameters params) async {
    return await repository.getFavouritedCourses();
  }
}
