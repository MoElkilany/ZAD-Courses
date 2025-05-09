import 'quiz_result_model.dart';
import '../../../domain/entities/student/quiz_result.dart';
import '../../../domain/entities/student/quiz_results_list.dart';

class QuizResultListModel extends QuizResultsList {
  const QuizResultListModel({
    required super.all,
    required super.passed,
    required super.open,
    required super.failed,
    required super.results,
  });

  factory QuizResultListModel.fromJson(Map<String, dynamic> json) => QuizResultListModel(
        all: json['results'].length,
        passed: json['results'].where((element) => element['status'] == 'passed').length,
        open: json['results'].where((element) => element['status'] == 'waiting').length,
        failed: json['results'].where((element) => element['status'] == 'failed').length,
        results: json['results'].map<QuizResult>((e) => QuizResultModel.fromJson(e)).toList(),
      );

  Map<String, dynamic> toJson() => {
        'all': all,
        'passed': passed,
        'open': open,
        'failed': failed,
        'results': results.map((e) => (e as QuizResultModel).toJson()).toList(),
      };
}
