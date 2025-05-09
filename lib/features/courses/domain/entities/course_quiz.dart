import 'package:equatable/equatable.dart';

/// Represents a course quiz entity.
class CourseQuiz extends Equatable {
  /// The unique identifier of the quiz.
  final int id;

  /// The title of the quiz.
  final String title;

  /// The status of the quiz.
  final String status;

  /// Creates a new instance of [CourseQuiz].
  ///
  /// [id] is the unique identifier of the quiz.
  ///
  /// [title] is the title of the quiz.
  ///
  /// [status] is the status of the quiz.
  const CourseQuiz({
    required this.id,
    required this.title,
    required this.status,
  });

  @override
  List<Object?> get props => [id, title, status];
}
