import 'package:flutter/foundation.dart';
import '../../../domain/entities/student/quiz_result.dart';

class StudentQuizResultsList {
  final List<QuizResult> allQuizzes;

  final List<QuizResult> filteredQuizzes;

  final List<QuizResult> dropDownQuizzes;

  final QuizResult? selectedQuiz;

  const StudentQuizResultsList({
    this.allQuizzes = const [],
    this.filteredQuizzes = const [],
    this.dropDownQuizzes = const [],
    this.selectedQuiz,
  });

  StudentQuizResultsList copyWith({
    List<QuizResult>? allQuizzes,
    List<QuizResult>? filteredQuizzes,
    List<QuizResult>? dropDownQuizzes,
    QuizResult? selectedQuiz,
  }) {
    return StudentQuizResultsList(
      allQuizzes: allQuizzes ?? this.allQuizzes,
      filteredQuizzes: filteredQuizzes ?? this.filteredQuizzes,
      dropDownQuizzes: dropDownQuizzes ?? this.dropDownQuizzes,
      selectedQuiz: selectedQuiz,
    );
  }

  @override
  String toString() {
    return 'StudentQuizResultsList(allQuizzes: $allQuizzes, filteredQuizzes: $filteredQuizzes, dropDownQuizzes: $dropDownQuizzes, selectedQuiz: $selectedQuiz)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentQuizResultsList &&
        listEquals(other.allQuizzes, allQuizzes) &&
        listEquals(other.filteredQuizzes, filteredQuizzes) &&
        listEquals(other.dropDownQuizzes, dropDownQuizzes) &&
        other.selectedQuiz == selectedQuiz;
  }

  @override
  int get hashCode {
    return allQuizzes.hashCode ^ filteredQuizzes.hashCode ^ dropDownQuizzes.hashCode ^ selectedQuiz.hashCode;
  }
}
