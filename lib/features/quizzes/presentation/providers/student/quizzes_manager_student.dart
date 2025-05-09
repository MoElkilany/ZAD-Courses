import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/entities/student/quiz_not_submitted.dart';
import '../../../domain/entities/student/quiz_result.dart';
import 'quiz_not_submitted_list_student.dart';
import 'quiz_results_list_student.dart';
import 'quizzes_filter_student.dart';

part 'quizzes_manager_student.g.dart';

@Riverpod(keepAlive: true)
class StudentResultsListManager extends _$StudentResultsListManager {
  @override
  StudentQuizResultsList build() {
    return const StudentQuizResultsList();
  }

  //how to read state
  List<QuizResult> get allQuizzes => state.allQuizzes;
  List<QuizResult> get filteredQuizzes => state.filteredQuizzes;
  List<QuizResult> get dropDownQuizzes => state.dropDownQuizzes;
  QuizResult? get selectedQuiz => state.selectedQuiz;

  void setFilteredQuizzes() {
    final filters = ref.watch(studentQuizResultsFilterProvider.notifier);
    List<QuizResult> newFilteredQuizzes = state.allQuizzes;

    //if query is not null, filter by it
    if (filters.query != null) {
      newFilteredQuizzes = newFilteredQuizzes
          .where(
            (e) => e.title.toLowerCase().contains(
                  filters.query!.toLowerCase(),
                ),
          )
          .toList();
    }
    // filters.resetQuery();

    //apply all filters one by one

    if (state.selectedQuiz != null) {
      newFilteredQuizzes = newFilteredQuizzes.where((e) => e.courseTitle == state.selectedQuiz!.courseTitle).toList();
    }

    List<QuizResult> temp = [];
    //if isPending is true, add all pending quizzes to temp
    if (filters.isWaiting || filters.isPassed || filters.isFailed) {
      if (filters.isWaiting) {
        temp.addAll(newFilteredQuizzes.where((e) => e.status == 'waiting'));
      }
      //if isPassed is true, add all passed quizzes to temp
      if (filters.isPassed) {
        temp.addAll(newFilteredQuizzes.where((e) => e.status == 'passed'));
      }
      //if isFailed is true, add all failed quizzes to temp
      if (filters.isFailed) {
        temp.addAll(newFilteredQuizzes.where((e) => e.status == 'failed'));
      }
      newFilteredQuizzes = temp;
    }

    //if courseClass is not null, filter by it
    if (filters.courseClass != null) {
      newFilteredQuizzes = newFilteredQuizzes
          .where(
            (e) => e.courseTitle.toLowerCase().contains(
                  filters.courseClass!.toLowerCase(),
                ),
          )
          .toList();
    }

    state = state.copyWith(
      allQuizzes: state.allQuizzes,
      filteredQuizzes: newFilteredQuizzes,
      dropDownQuizzes: state.dropDownQuizzes,
      selectedQuiz: state.selectedQuiz,
    );
  }

  List<DropdownMenuItem<QuizResult>>? get dropDownQuizzesItems {
    if (state.allQuizzes.isEmpty) {
      return null;
    }

    //sort quizzes by course title
    List<QuizResult> sortedQuizzes = state.allQuizzes..sort((a, b) => a.courseTitle.compareTo(b.courseTitle));

    // remove duplicate course titles (can be same course title but different course code)
    final uniqueTitleList =
        sortedQuizzes.map((e) => e.courseTitle).toSet().toList().map((e) => sortedQuizzes.firstWhere((element) => element.courseTitle == e)).toList();
    //map quizzes to dropdown items
    List<DropdownMenuItem<QuizResult>> items = uniqueTitleList
        .map(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(e.courseTitle),
          ),
        )
        .toList();
    return items;
  }

  void setSelectedQuiz(QuizResult? quiz) {
    if (quiz == null) {
      state = state.copyWith(
        allQuizzes: state.allQuizzes,
        filteredQuizzes: state.filteredQuizzes,
        dropDownQuizzes: state.dropDownQuizzes,
        selectedQuiz: null,
      );
      return;
    }
    //quiz with same course title as input
    final quizWithSameCourseTitle = state.allQuizzes.where((e) => e.courseTitle.toLowerCase().contains(quiz.courseTitle.toLowerCase())).toList();

    state = state.copyWith(
      allQuizzes: state.allQuizzes,
      filteredQuizzes: state.filteredQuizzes,
      dropDownQuizzes: state.dropDownQuizzes,
      selectedQuiz: quizWithSameCourseTitle.first,
    );
  }

  void resetAll() {
    state = const StudentQuizResultsList();
  }

  void resetSelectedQuiz() {
    state = state.copyWith(
      allQuizzes: state.allQuizzes,
      filteredQuizzes: state.filteredQuizzes,
      dropDownQuizzes: state.dropDownQuizzes,
      selectedQuiz: null,
    );
  }

  void resetFilteredQuizzes() {
    state = state.copyWith(
      allQuizzes: state.allQuizzes,
      filteredQuizzes: state.allQuizzes,
      dropDownQuizzes: state.dropDownQuizzes,
      selectedQuiz: state.selectedQuiz,
    );
  }

  //set all quizzes
  void setAllQuizzes(List<QuizResult> value) {
    state = state.copyWith(
      allQuizzes: value,
      filteredQuizzes: state.filteredQuizzes,
      dropDownQuizzes: state.dropDownQuizzes,
      selectedQuiz: state.selectedQuiz,
    );
  }

  void initFilteredQuizzes() {
    state = state.copyWith(
      allQuizzes: state.allQuizzes,
      filteredQuizzes: state.allQuizzes,
      dropDownQuizzes: state.dropDownQuizzes,
      selectedQuiz: state.selectedQuiz,
    );
  }
}

@Riverpod(keepAlive: true)
class StudentNotSubmittedListManager extends _$StudentNotSubmittedListManager {
  @override
  StudentQuizzesNotSubmittedList build() {
    return const StudentQuizzesNotSubmittedList();
  }

  //how to read state
  List<QuizNotSubmitted> get allQuizzes => state.allQuizzes;
  List<QuizNotSubmitted> get filteredQuizzes => state.filteredQuizzes;
  List<QuizNotSubmitted> get dropDownQuizzes => state.dropDownQuizzes;
  QuizNotSubmitted? get selectedQuiz => state.selectedQuiz;

  void setFilteredQuizzes() {
    final filters = ref.watch(studentQuizNotSubmittedFilterProvider.notifier);
    List<QuizNotSubmitted> newFilteredQuizzes = state.allQuizzes;

    //if query is not null, filter by it
    if (filters.query != null) {
      newFilteredQuizzes = newFilteredQuizzes
          .where(
            (e) => e.title.toLowerCase().contains(
                  filters.query!.toLowerCase(),
                ),
          )
          .toList();
    }
    // filters.resetQuery();

    //apply all filters one by one

    if (state.selectedQuiz != null) {
      newFilteredQuizzes = newFilteredQuizzes.where((e) => e.courseTitle == state.selectedQuiz!.courseTitle).toList();
    }

    //if courseClass is not null, filter by it
    if (filters.courseClass != null) {
      newFilteredQuizzes = newFilteredQuizzes
          .where(
            (e) => e.courseTitle.toLowerCase().contains(
                  filters.courseClass!.toLowerCase(),
                ),
          )
          .toList();
    }

    state = state.copyWith(
      allQuizzes: state.allQuizzes,
      filteredQuizzes: newFilteredQuizzes,
      dropDownQuizzes: state.dropDownQuizzes,
      selectedQuiz: state.selectedQuiz,
    );
  }

  List<DropdownMenuItem<QuizNotSubmitted>>? get dropDownQuizzesItems {
    if (state.allQuizzes.isEmpty) {
      return null;
    }

    //sort quizzes by course title
    List<QuizNotSubmitted> sortedQuizzes = state.allQuizzes..sort((a, b) => a.courseTitle.compareTo(b.courseTitle));

    // remove duplicates
    sortedQuizzes = sortedQuizzes.toSet().toList();

    //map quizzes to dropdown items
    List<DropdownMenuItem<QuizNotSubmitted>> items = sortedQuizzes
        .map(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(e.courseTitle),
          ),
        )
        .toList();
    return items;
  }

  void setSelectedQuiz(QuizNotSubmitted? quiz) {
    if (quiz == null) {
      state = state.copyWith(
        allQuizzes: state.allQuizzes,
        filteredQuizzes: state.filteredQuizzes,
        dropDownQuizzes: state.dropDownQuizzes,
        selectedQuiz: null,
      );
      return;
    }
    //quiz with same course title as input
    final quizWithSameCourseTitle = state.allQuizzes.where((e) => e.courseTitle.toLowerCase().contains(quiz.courseTitle.toLowerCase())).toList();

    state = state.copyWith(
      allQuizzes: state.allQuizzes,
      filteredQuizzes: state.filteredQuizzes,
      dropDownQuizzes: state.dropDownQuizzes,
      selectedQuiz: quizWithSameCourseTitle.first,
    );
  }

  void resetAll() {
    state = const StudentQuizzesNotSubmittedList();
  }

  void resetSelectedQuiz() {
    state = state.copyWith(
      allQuizzes: state.allQuizzes,
      filteredQuizzes: state.filteredQuizzes,
      dropDownQuizzes: state.dropDownQuizzes,
      selectedQuiz: null,
    );
  }

  void resetFilteredQuizzes() {
    state = state.copyWith(
      allQuizzes: state.allQuizzes,
      filteredQuizzes: state.allQuizzes,
      dropDownQuizzes: state.dropDownQuizzes,
      selectedQuiz: state.selectedQuiz,
    );
  }

  //set all quizzes
  void setAllQuizzes(List<QuizNotSubmitted> value) {
    state = state.copyWith(
      allQuizzes: value,
      filteredQuizzes: state.filteredQuizzes,
      dropDownQuizzes: state.dropDownQuizzes,
      selectedQuiz: state.selectedQuiz,
    );
  }

  void initFilteredQuizzes() {
    state = state.copyWith(
      allQuizzes: state.allQuizzes,
      filteredQuizzes: state.allQuizzes,
      dropDownQuizzes: state.dropDownQuizzes,
      selectedQuiz: state.selectedQuiz,
    );
  }
}
