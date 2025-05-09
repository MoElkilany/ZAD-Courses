import '../../domain/entities/course_request.dart';

/// A model class representing a course request.
class CourseRequestModel extends CourseRequest {
  /// Constructs a [CourseRequestModel] instance.
  ///
  /// [courseId] is the ID of the course being requested.
  /// [userId] is the ID of the user requesting the course.
  const CourseRequestModel({
    required super.courseId,
    required int userId,
  });

  /// Constructs a [CourseRequestModel] instance from a JSON map.
  ///
  /// [json] is the JSON map to construct the instance from.
  factory CourseRequestModel.fromJson(Map<String, dynamic> json) {
    return CourseRequestModel(
      courseId: json['courseId'],
      userId: json['userId'],
    );
  }

  /// Converts this [CourseRequestModel] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'courseId': courseId,
    };
  }
}
