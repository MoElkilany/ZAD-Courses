import 'package:equatable/equatable.dart';

/// A class representing a course assignment entity.
class CourseAssignment extends Equatable {
  /// The unique identifier of the course assignment.
  final int id;

  /// The title of the course assignment.
  final String title;

  /// The status of the course assignment.
  final String status;

  /// Creates a new instance of [CourseAssignment].
  ///
  /// [id] is the unique identifier of the course assignment.
  ///
  /// [title] is the title of the course assignment.
  ///
  /// [status] is the status of the course assignment.
  const CourseAssignment({
    required this.id,
    required this.title,
    required this.status,
  });

  @override
  List<Object?> get props => [id, title, status];
}
