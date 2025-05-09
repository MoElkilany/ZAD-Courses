import 'package:flutter/foundation.dart';
import '../../../domain/entities/teacher/quiz_teacher.dart';

class TeacherQuizListState {
  final List<QuizTeacher> allQuizzes;

  final List<QuizTeacher> filteredQuizzes;

  final List<QuizTeacher> dropDownQuizzes;

  final QuizTeacher? selectedQuiz;

  const TeacherQuizListState({
    this.allQuizzes = const [],
    this.filteredQuizzes = const [],
    this.dropDownQuizzes = const [],
    this.selectedQuiz,
  });

  TeacherQuizListState copyWith({
    List<QuizTeacher>? allQuizzes,
    List<QuizTeacher>? filteredQuizzes,
    List<QuizTeacher>? dropDownQuizzes,
    QuizTeacher? selectedQuiz,
  }) {
    return TeacherQuizListState(
      allQuizzes: allQuizzes ?? this.allQuizzes,
      filteredQuizzes: filteredQuizzes ?? this.filteredQuizzes,
      dropDownQuizzes: dropDownQuizzes ?? this.dropDownQuizzes,
      selectedQuiz: selectedQuiz,
    );
  }

  @override
  String toString() {
    return 'TeacherQuizListState(allQuizzes: $allQuizzes, filteredQuizzes: $filteredQuizzes, dropDownQuizzes: $dropDownQuizzes, selectedQuiz: $selectedQuiz)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TeacherQuizListState &&
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
