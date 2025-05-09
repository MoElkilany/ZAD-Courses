import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'noticeboard_filter_state.dart';

part 'noticeboard_filter.g.dart';

@Riverpod(keepAlive: true)
class NoticeboardFilter extends _$NoticeboardFilter {
  @override
  NoticeboardFilterState build() {
    return const NoticeboardFilterState();
  }

  //how to read state
  DateTime? get firstSubmission => state.firstSubmission;
  DateTime? get lastSubmission => state.lastSubmission;
  String? get query => state.query;

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
      firstSubmission: null,
      lastSubmission: null,
      query: null,
    );
  }
}
