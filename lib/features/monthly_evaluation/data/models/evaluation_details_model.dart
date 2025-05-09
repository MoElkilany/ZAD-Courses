import '../../domain/entities/evaluation_details.dart';
import 'assignment_model.dart';
import 'quiz_model.dart';
import 'topic.dart';

class EvaluationDetailsModel extends EvaluationDetails {
  const EvaluationDetailsModel({
    required super.courseTitle,
    required super.month,
    required super.studentName,
    required super.assignments,
    required super.quizzes,
    required super.topics,
    required super.hints,
    required super.notes,
  });

  factory EvaluationDetailsModel.fromJson(Map<String, dynamic> json) {
    return EvaluationDetailsModel(
      courseTitle: json['evaluation']['course']['titleCourseGroup'],
      month: json['evaluation']['month'],
      studentName: json['evaluation']['user']['full_name'],
      assignments: (json['topics'] as List)
          .expand(
            (t) => (t['assignments'] as List).cast<Map<String, dynamic>>().map(
                  AssignmentModel.fromJson,
                ),
          )
          .toList(),
      quizzes: (json['topics'] as List)
          .expand(
            (t) => (t['quizzes'] as List).cast<Map<String, dynamic>>().map(
                  QuizModel.fromJson,
                ),
          )
          .toList(),
      topics: (json['topics'] as List)
          .cast<Map<String, dynamic>>()
          .map(
            TopicModel.fromJson,
          )
          .toList(),
      hints: (json['evaluationHints'] as List)
          .cast<Map<String, dynamic>>()
          .map(
            (m) => m['hint'],
          )
          .cast<String>()
          .toList(),
      notes: json['evaluation']['notes'],
    );
  }
}
