import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/course.dart';
import '../entities/course_request.dart';
import '../repositories/course_repository.dart';

/// A use case that adds or removes a course from the user's favourite courses list in the [CourseRepository] based on the [CourseRequest] parameters.
class ToggleFavourite extends UseCase<void, CourseRequest> {
  final CourseRepository repository;

  /// Constructor that takes a [CourseRepository] as a parameter.
  ToggleFavourite({
    required this.repository,
  });

  /// Calls the [CourseRepository.toggleFavourite] method with the given [params] and returns the result as an [Either] object.
  ///
  /// If the operation is successful, the [Either] object contains the retrieved [Course] object.
  /// If the operation fails, the [Either] object contains a [Failure] object.
  @override
  Future<Either<Failure, void>> call(CourseRequest params) async {
    return await repository.getCourse(
      params.courseId,
    );
  }
}
