import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/entities/teacher/quiz_teacher.dart';
import 'quiz_list_state_teacher.dart';
import 'quizzes_filter_teacher.dart';

part 'quizzes_manager_student.g.dart';

@Riverpod(keepAlive: true)
class TeacherQuizListManager extends _$TeacherQuizListManager {
  @override
  TeacherQuizListState build() {
    return const TeacherQuizListState();
  }

  //how to read state
  List<QuizTeacher> get allQuizzes => state.allQuizzes;
  List<QuizTeacher> get filteredQuizzes => state.filteredQuizzes;
  List<QuizTeacher> get dropDownQuizzes => state.dropDownQuizzes;
  QuizTeacher? get selectedQuiz => state.selectedQuiz;

  void setFilteredQuizzes() {
    final filters = ref.watch(teacherQuizListFilterProvider.notifier);
    List<QuizTeacher> newFilteredQuizzes = state.allQuizzes;

    //if query is not null, filter by it
    if (filters.query != null) {
      newFilteredQuizzes = newFilteredQuizzes
          .where(
            (e) =>
                e.quizTitle.toLowerCase().contains(
                      filters.query!.toLowerCase(),
                    ) ||
                e.courseTitle.toLowerCase().contains(filters.query!.toLowerCase()),
          )
          .toList();
    }
    // filters.resetQuery();

    //apply all filters one by one

    if (state.selectedQuiz != null) {
      newFilteredQuizzes = newFilteredQuizzes.where((e) => e.courseTitle == state.selectedQuiz!.courseTitle).toList();
    }

    List<QuizTeacher> temp = [];
    //if isPending is true, add all pending quizzes to temp
    if (filters.isActive || filters.isExpired) {
      if (filters.isActive) {
        temp.addAll(newFilteredQuizzes.where((e) => e.status == 'active'));
      }
      //if isPassed is true, add all passed quizzes to temp
      if (filters.isExpired) {
        temp.addAll(newFilteredQuizzes.where((e) => e.status != 'active'));
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

  List<DropdownMenuItem<QuizTeacher>>? get dropDownQuizzesItems {
    if (state.allQuizzes.isEmpty) {
      return null;
    }

    //sort quizzes by course title
    List<QuizTeacher> sortedQuizzes = state.allQuizzes..sort((a, b) => a.courseTitle.compareTo(b.courseTitle));

    // remove duplicate course titles (can be same course title but different course code)
    final uniqueTitleList =
        sortedQuizzes.map((e) => e.courseTitle).toSet().toList().map((e) => sortedQuizzes.firstWhere((element) => element.courseTitle == e)).toList();
    //map quizzes to dropdown items
    List<DropdownMenuItem<QuizTeacher>> items = uniqueTitleList
        .map(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(e.courseTitle),
          ),
        )
        .toList();
    return items;
  }

  void setSelectedQuiz(QuizTeacher? quiz) {
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
    state = const TeacherQuizListState();
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
  void setAllQuizzes(List<QuizTeacher> value) {
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
