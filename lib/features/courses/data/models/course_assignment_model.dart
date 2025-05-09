import '../../domain/entities/course_assignment.dart';

/// A model class that represents a course assignment.
class CourseAssignmentModel extends CourseAssignment {
  /// Creates a [CourseAssignmentModel] instance.
  ///
  /// The [id], [title], and [status] parameters must not be null.
  const CourseAssignmentModel({
    required super.id,
    required super.title,
    required super.status,
  });

  /// Creates a [CourseAssignmentModel] instance from a JSON object.
  ///
  /// The [json] parameter must not be null.
  factory CourseAssignmentModel.fromJson(Map<String, dynamic> json) {
    return CourseAssignmentModel(
      id: json['id'],
      title: json['translations'][0]['title'],
      status: json['status'],
    );
  }

  /// Converts this [CourseAssignmentModel] instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'status': status,
    };
  }
}
