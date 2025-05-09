import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'quiz_list_filter_state_teacher.dart';

part 'quizzes_filter_teacher.g.dart';

@Riverpod(keepAlive: true)
class TeacherQuizListFilter extends _$TeacherQuizListFilter {
  @override
  QuizListFilterStateTeacher build() {
    return const QuizListFilterStateTeacher();
  }

  //how to read state
  bool get isActive => state.isActive;
  bool get isExpired => state.isExpired;

  String? get courseClass => state.courseClass;
  String? get query => state.query;

  void setCourseClass(String? courseClass) {
    state = state.copyWith(
      courseClass: courseClass,
      query: query,
      isActive: isActive,
      isExpired: isExpired,
    );
  }

  void setQuery(String? query) {
    state = state.copyWith(
      courseClass: courseClass,
      query: query,
      isActive: isActive,
      isExpired: isExpired,
    );
  }

  void setIsActive(bool isActive) {
    state = state.copyWith(
      courseClass: courseClass,
      query: query,
      isActive: isActive,
      isExpired: isExpired,
    );
  }

  void setIsExpired(bool isExpired) {
    state = state.copyWith(
      courseClass: courseClass,
      query: query,
      isActive: isActive,
      isExpired: isExpired,
    );
  }

  void resetAll() {
    state = const QuizListFilterStateTeacher();
  }

  void resetCourseClass() {
    state = state.copyWith(
      courseClass: null,
      query: query,
      isActive: isActive,
      isExpired: isExpired,
    );
  }

  void resetQuery() {
    state = state.copyWith(
      courseClass: courseClass,
      query: null,
      isActive: isActive,
      isExpired: isExpired,
    );
  }
}
