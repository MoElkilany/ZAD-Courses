import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'assignments_filter_state.dart';

part 'assignments_filter.g.dart';

@Riverpod(keepAlive: true)
class StudentAssignmentsFilter extends _$StudentAssignmentsFilter {
  @override
  StudentAssignmentsFilterState build() {
    return const StudentAssignmentsFilterState();
  }

  //how to read state
  bool get isPending => state.isPending;
  bool get isPassed => state.isPassed;
  bool get isFailed => state.isFailed;
  bool get isNotSubmitted => state.isNotSubmitted;

  DateTime? get firstSubmission => state.firstSubmission;
  DateTime? get lastSubmission => state.lastSubmission;
  String? get query => state.query;

  void setPending(bool value) {
    final newState = state.copyWith(
      isPending: value,
      firstSubmission: state.firstSubmission,
      lastSubmission: state.lastSubmission,
      query: state.query,
    );
    state = newState;
  }

  void setPassed(bool value) {
    state = state.copyWith(
      isPassed: value,
      firstSubmission: state.firstSubmission,
      lastSubmission: state.lastSubmission,
      query: state.query,
    );
  }

  void setFailed(bool value) {
    state = state.copyWith(
      isFailed: value,
      firstSubmission: state.firstSubmission,
      lastSubmission: state.lastSubmission,
      query: state.query,
    );
  }

  void setNotSubmitted(bool value) {
    state = state.copyWith(
      isNotSubmitted: value,
      firstSubmission: state.firstSubmission,
      lastSubmission: state.lastSubmission,
      query: state.query,
    );
  }

  void _swapSubmission() {
    final firstSubmission = state.firstSubmission;
    final lastSubmission = state.lastSubmission;
    state = state.copyWith(
      firstSubmission: lastSubmission,
      lastSubmission: firstSubmission,
      query: state.query,
    );
  }

  void setFirstSubmission(DateTime? value) {
    state = state.copyWith(
      firstSubmission: value,
      lastSubmission: state.lastSubmission,
      query: state.query,
    );
    //if first submission is after last submission, swap them
    if (state.lastSubmission != null && state.firstSubmission != null && state.firstSubmission!.isAfter(state.lastSubmission!)) {
      _swapSubmission();
    }
  }

  void setLastSubmission(DateTime? value) {
    state = state.copyWith(
      lastSubmission: value,
      firstSubmission: state.firstSubmission,
      query: state.query,
    );

    //if first submission is after last submission, swap them
    if (state.lastSubmission != null && state.firstSubmission != null && state.firstSubmission!.isAfter(state.lastSubmission!)) {
      _swapSubmission();
    }
  }

  void setQuery(String? value) {
    state = state.copyWith(
      query: value,
      firstSubmission: state.firstSubmission,
      lastSubmission: state.lastSubmission,
    );
  }

  void resetQuery() {
    state = state.copyWith(
      query: null,
      firstSubmission: state.firstSubmission,
      lastSubmission: state.lastSubmission,
    );
  }

  void resetSubmission() {
    state = state.copyWith(
      firstSubmission: null,
      lastSubmission: null,
      query: null,
    );
  }

  void resetAll() {
    state = state.copyWith(
      isPending: false,
      isPassed: false,
      isFailed: false,
      isNotSubmitted: false,
      firstSubmission: null,
      lastSubmission: null,
      query: null,
    );
  }
}

@Riverpod(keepAlive: true)
class TeacherAssignmentsFilter extends _$TeacherAssignmentsFilter {
  @override
  TeacherAssignmentsFilterState build() {
    return const TeacherAssignmentsFilterState();
  }

  //how to read state
  bool get isActive => state.isActive;
  bool get isExpired => state.isExpired;
  String? get query => state.query;

  void setActive(bool value) {
    state = state.copyWith(
      isActive: value,
      query: state.query,
    );
  }

  void setExpired(bool value) {
    state = state.copyWith(
      isExpired: value,
      query: state.query,
    );
  }

  void setQuery(String? value) {
    state = state.copyWith(
      query: value,
    );
  }

  void resetQuery() {
    state = state.copyWith(
      query: null,
    );
  }

  void resetAll() {
    state = state.copyWith(
      isActive: false,
      isExpired: false,
      query: null,
    );
  }
}
