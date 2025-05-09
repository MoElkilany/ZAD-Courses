import 'assignment.dart';
import 'quiz.dart';
import 'topic.dart';

class EvaluationDetails {
  final String month;
  final String courseTitle;
  final String studentName;
  final List<Topic> topics;
  final List<Quiz> quizzes;
  final List<Assignment> assignments;
  final List<String> hints;
  final String notes;

  const EvaluationDetails({
    required this.courseTitle,
    required this.month,
    required this.studentName,
    required this.topics,
    required this.quizzes,
    required this.assignments,
    required this.hints,
    required this.notes,
  });
}
