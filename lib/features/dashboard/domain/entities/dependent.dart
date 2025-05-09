import 'bar_data.dart';

class Dependent {
  final String studentName;
  final int courses;
  final int assignments;
  final int quizzes;
  final List<List<String>> xAxis;
  final List<BarData> yAxis;
  Dependent({
    required this.studentName,
    required this.courses,
    required this.assignments,
    required this.quizzes,
    required this.xAxis,
    required this.yAxis,
  });
}
