import 'package:equatable/equatable.dart';
import 'quiz_result.dart';

class QuizResultsList extends Equatable {
  final int all;
  final int passed;
  final int open;
  final int failed;

  final List<QuizResult> results;

  const QuizResultsList({
    required this.all,
    required this.passed,
    required this.open,
    required this.failed,
    required this.results,
  });

  @override
  List<Object?> get props => [
        all,
        passed,
        open,
        failed,
      ];
}
