import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/purchase.dart';
import '../repositories/course_repository.dart';

/// A use case that retrieves a a list of [PurchasedCourse] from the [CourseRepository] based on the access token of the user.
class GetPurchasedCourses extends UseCase<List<PurchasedCourse>, NoParameters> {
  final CourseRepository repository;

  /// Constructor that takes a [CourseRepository] as a parameter.
  GetPurchasedCourses({
    required this.repository,
  });

  /// Calls the [CourseRepository.getPurchasedCourses] method and returns the result as an [Either] object.
  ///
  /// If the operation is successful, the [Either] object contains the retrieved list of [PurchasedCourse] objects.
  /// If the operation fails, the [Either] object contains a [Failure] object.
  @override
  Future<Either<Failure, List<PurchasedCourse>>> call(NoParameters params) async {
    return await repository.getPurchasedCourses();
  }
}
