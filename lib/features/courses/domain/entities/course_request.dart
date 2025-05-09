import 'package:equatable/equatable.dart';

/// A class representing a course request made by a user.
class CourseRequest extends Equatable {
  /// The ID of the course being requested.
  final int courseId;

  /// Creates a new instance of [CourseRequest].
  ///
  /// [courseId] is the ID of the course being requested.

  const CourseRequest({
    required this.courseId,
  });

  @override
  List<Object?> get props => [courseId];
}
