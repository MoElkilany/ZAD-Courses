import 'course.dart';
import 'evaluation.dart';

class EvaluationData {
  final List<MonthlyEvaluation> evaluations;
  final List<Course> courses;

  EvaluationData({
    required this.evaluations,
    required this.courses,
  });
}
