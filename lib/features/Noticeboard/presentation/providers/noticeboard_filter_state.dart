import 'package:flutter/foundation.dart';

/// Immutable class that represents the state of the filter for student assignments.
@immutable
class NoticeboardFilterState {
  /// The date of the first submission.
  final DateTime? firstSubmission;

  /// The date of the last submission.
  final DateTime? lastSubmission;

  /// Search Query
  final String? query;

  /// Constructor for the [NoticeboardFilterState] class.
  const NoticeboardFilterState({
    this.firstSubmission,
    this.lastSubmission,
    this.query,
  });

  /// Returns a new instance of [NoticeboardFilterState] with the specified properties.
  NoticeboardFilterState copyWith({
    required DateTime? firstSubmission,
    required DateTime? lastSubmission,
    required String? query,
  }) {
    return NoticeboardFilterState(
      firstSubmission: firstSubmission,
      lastSubmission: lastSubmission,
      query: query,
    );
  }

  /// Returns a string representation of the [NoticeboardFilterState] object.
  @override
  String toString() {
    return 'NoticeboardFilterState(firstSubmission: $firstSubmission, lastSubmission: $lastSubmission, query: $query)';
  }

  /// Checks if the [NoticeboardFilterState] object is equal to another object.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NoticeboardFilterState &&
        other.firstSubmission == firstSubmission &&
        other.lastSubmission == lastSubmission &&
        other.query == query;
  }

  /// Returns the hash code of the [NoticeboardFilterState] object.
  @override
  int get hashCode {
    return firstSubmission.hashCode ^ lastSubmission.hashCode ^ query.hashCode;
  }
}
