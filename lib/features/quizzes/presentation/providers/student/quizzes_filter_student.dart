import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'quiz_not_submitted_filter_state_student.dart';
import 'quiz_results_filter_state_student.dart';

part 'quizzes_filter_student.g.dart';

@Riverpod(keepAlive: true)
class StudentQuizResultsFilter extends _$StudentQuizResultsFilter {
  @override
  QuizResultsFilterStateStudent build() {
    return const QuizResultsFilterStateStudent();
  }

  //how to read state
  bool get isWaiting => state.isWaiting;
  bool get isPassed => state.isPassed;
  bool get isFailed => state.isFailed;

  String? get courseClass => state.courseClass;
  String? get query => state.query;

  void setCourseClass(String? courseClass) {
    state = state.copyWith(
      courseClass: courseClass,
      query: query,
      isWaiting: isWaiting,
      isPassed: isPassed,
      isFailed: isFailed,
    );
  }

  void setQuery(String? query) {
    state = state.copyWith(
      courseClass: courseClass,
      query: query,
      isWaiting: isWaiting,
      isPassed: isPassed,
      isFailed: isFailed,
    );
  }

  void setIsWaiting(bool isWaiting) {
    state = state.copyWith(
      courseClass: courseClass,
      query: query,
      isWaiting: isWaiting,
      isPassed: isPassed,
      isFailed: isFailed,
    );
  }

  void setIsPassed(bool isPassed) {
    state = state.copyWith(
      courseClass: courseClass,
      query: query,
      isWaiting: isWaiting,
      isPassed: isPassed,
      isFailed: isFailed,
    );
  }

  void setIsFailed(bool isFailed) {
    state = state.copyWith(
      courseClass: courseClass,
      query: query,
      isWaiting: isWaiting,
      isPassed: isPassed,
      isFailed: isFailed,
    );
  }

  void resetAll() {
    state = const QuizResultsFilterStateStudent();
  }

  void resetCourseClass() {
    state = state.copyWith(
      courseClass: null,
      query: query,
      isWaiting: isWaiting,
      isPassed: isPassed,
      isFailed: isFailed,
    );
  }

  void resetQuery() {
    state = state.copyWith(
      courseClass: courseClass,
      query: null,
      isWaiting: isWaiting,
      isPassed: isPassed,
      isFailed: isFailed,
    );
  }
}

@Riverpod(keepAlive: true)
class StudentQuizNotSubmittedFilter extends _$StudentQuizNotSubmittedFilter {
  @override
  QuizNotSubmittedFilterStateStudent build() {
    return const QuizNotSubmittedFilterStateStudent();
  }

  //how to read state
  String? get courseClass => state.courseClass;
  String? get query => state.query;

  void setCourseClass(String? courseClass) {
    state = state.copyWith(
      courseClass: courseClass,
      query: query,
    );
  }

  void setQuery(String? query) {
    state = state.copyWith(
      courseClass: courseClass,
      query: query,
    );
  }

  void resetAll() {
    state = const QuizNotSubmittedFilterStateStudent();
  }

  void resetCourseClass() {
    state = state.copyWith(
      courseClass: null,
      query: query,
    );
  }

  void resetQuery() {
    state = state.copyWith(
      courseClass: courseClass,
      query: null,
    );
  }
}
