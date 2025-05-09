import '../../domain/entities/course_quiz.dart';

/// A model class representing a course quiz.
class CourseQuizModel extends CourseQuiz {
  /// Constructs a [CourseQuizModel] instance.
  ///
  /// [id], [title], and [status] are required parameters.
  const CourseQuizModel({
    required super.id,
    required super.title,
    required super.status,
  });

  /// Constructs a [CourseQuizModel] instance from a JSON map.
  ///
  /// [json] is a required parameter.
  factory CourseQuizModel.fromJson(Map<String, dynamic> json) {
    return CourseQuizModel(
      id: json['id'],
      title: json['translations'][0]['title'],
      status: json['status'],
    );
  }

  /// Converts a [CourseQuizModel] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'status': status,
    };
  }
}
