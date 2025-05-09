import '../../domain/entities/dependent.dart';
import 'bar_data_model.dart';

class DependentModel extends Dependent {
  DependentModel({
    required super.studentName,
    required super.courses,
    required super.assignments,
    required super.quizzes,
    required super.xAxis,
    required super.yAxis,
  });
  factory DependentModel.fromJson(Map<String, dynamic> json) {
    return DependentModel(
      studentName: json['full_name'],
      courses: json['courses_count'],
      assignments: json['assignment_count'],
      quizzes: json['quizzes_count'],
      xAxis: (json['learning_statistics']['xaxis'] as List).cast<List>().map((e) => e.cast<String>()).toList(),
      yAxis: (json['learning_statistics']['yaxis'] as List).cast<Map<String, dynamic>>().map(BarDataModel.fromJson).toList(),
    );
  }
}
