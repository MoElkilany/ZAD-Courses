import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'platform_filter_state.dart';

part 'platform_filter.g.dart';

@Riverpod(keepAlive: true)
class PlatformFilter extends _$PlatformFilter {
  @override
  PlatformFilterState build() {
    return const PlatformFilterState();
  }

  //how to read state
  bool get isReplied => state.isReplied;
  bool get isOpen => state.isOpen;
  bool get isClosed => state.isClosed;
  DateTime? get firstSubmission => state.firstSubmission;
  DateTime? get lastSubmission => state.lastSubmission;

  void setReplied(bool value) {
    final newState = state.copyWith(isReplied: value);
    state = newState;
  }

  void setOpen(bool value) {
    state = state.copyWith(isOpen: value);
  }

  void setClosed(bool value) {
    state = state.copyWith(isClosed: value);
  }

  void _swapSubmission() {
    final firstSubmission = state.firstSubmission;
    final lastSubmission = state.lastSubmission;
    state = state.copyWith(
      firstSubmission: lastSubmission,
      lastSubmission: firstSubmission,
    );
  }

  void setFirstSubmission(DateTime? value) {
    state = state.copyWith(
      firstSubmission: value,
      lastSubmission: state.lastSubmission,
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
    );

    //if first submission is after last submission, swap them
    if (state.lastSubmission != null && state.firstSubmission != null && state.firstSubmission!.isAfter(state.lastSubmission!)) {
      _swapSubmission();
    }
  }

  void resetSubmission() {
    state = state.copyWith(firstSubmission: null, lastSubmission: null);
  }

  void resetAll() {
    state = state.copyWith(
      isReplied: false,
      isOpen: false,
      isClosed: false,
      firstSubmission: null,
      lastSubmission: null,
    );
  }
}
