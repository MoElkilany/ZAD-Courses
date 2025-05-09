import '../../domain/entities/evaluations_data.dart';
import 'evaluation_model.dart';
import 'course_model.dart';

class EvaluationDataModel extends EvaluationData {
  EvaluationDataModel({
    required super.evaluations,
    required super.courses,
  });

  factory EvaluationDataModel.fromJson(Map<String, dynamic> json) {
    return EvaluationDataModel(
      evaluations: (json['evaluations'] as List).cast<Map<String, dynamic>>().map(EvaluationModel.fromJson).toList(),
      courses: (json['courses'] as List).cast<Map<String, dynamic>>().map(CourseModel.fromJson).toList(),
    );
  }
}
