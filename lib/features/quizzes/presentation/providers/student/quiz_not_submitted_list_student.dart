import 'package:flutter/foundation.dart';
import '../../../domain/entities/student/quiz_not_submitted.dart';

class StudentQuizzesNotSubmittedList {
  final List<QuizNotSubmitted> allQuizzes;

  final List<QuizNotSubmitted> filteredQuizzes;

  final List<QuizNotSubmitted> dropDownQuizzes;

  final QuizNotSubmitted? selectedQuiz;

  const StudentQuizzesNotSubmittedList({
    this.allQuizzes = const [],
    this.filteredQuizzes = const [],
    this.dropDownQuizzes = const [],
    this.selectedQuiz,
  });

  StudentQuizzesNotSubmittedList copyWith({
    List<QuizNotSubmitted>? allQuizzes,
    List<QuizNotSubmitted>? filteredQuizzes,
    List<QuizNotSubmitted>? dropDownQuizzes,
    QuizNotSubmitted? selectedQuiz,
  }) {
    return StudentQuizzesNotSubmittedList(
      allQuizzes: allQuizzes ?? this.allQuizzes,
      filteredQuizzes: filteredQuizzes ?? this.filteredQuizzes,
      dropDownQuizzes: dropDownQuizzes ?? this.dropDownQuizzes,
      selectedQuiz: selectedQuiz,
    );
  }

  @override
  String toString() {
    return 'StudentQuizzesNotSubmittedList(allQuizzes: $allQuizzes, filteredQuizzes: $filteredQuizzes, dropDownQuizzes: $dropDownQuizzes, selectedQuiz: $selectedQuiz)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentQuizzesNotSubmittedList &&
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
