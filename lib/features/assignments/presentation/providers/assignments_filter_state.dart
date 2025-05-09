import 'package:flutter/foundation.dart';

/// Immutable class that represents the state of the filter for student assignments.
@immutable
class StudentAssignmentsFilterState {
  /// Whether the assignment is pending.
  final bool isPending;

  /// Whether the assignment is passed.
  final bool isPassed;

  /// Whether the assignment is failed.
  final bool isFailed;

  /// Whether the assignment is not submitted.
  final bool isNotSubmitted;

  /// The date of the first submission.
  final DateTime? firstSubmission;

  /// The date of the last submission.
  final DateTime? lastSubmission;

  /// Search Query
  final String? query;

  /// Constructor for the [StudentAssignmentsFilterState] class.
  const StudentAssignmentsFilterState({
    this.isPending = false,
    this.isPassed = false,
    this.isFailed = false,
    this.isNotSubmitted = false,
    this.firstSubmission,
    this.lastSubmission,
    this.query,
  });

  /// Returns a new instance of [StudentAssignmentsFilterState] with the specified properties.
  StudentAssignmentsFilterState copyWith({
    bool? isPending,
    bool? isPassed,
    bool? isFailed,
    bool? isNotSubmitted,
    required DateTime? firstSubmission,
    required DateTime? lastSubmission,
    required String? query,
  }) {
    return StudentAssignmentsFilterState(
      isPending: isPending ?? this.isPending,
      isPassed: isPassed ?? this.isPassed,
      isFailed: isFailed ?? this.isFailed,
      isNotSubmitted: isNotSubmitted ?? this.isNotSubmitted,
      firstSubmission: firstSubmission,
      lastSubmission: lastSubmission,
      query: query,
    );
  }

  /// Returns a string representation of the [StudentAssignmentsFilterState] object.
  @override
  String toString() {
    return 'StudentAssignmentsFilterState(isPending: $isPending, isPassed: $isPassed, isFailed: $isFailed, isNotSubmitted: $isNotSubmitted, firstSubmission: $firstSubmission, lastSubmission: $lastSubmission)';
  }

  /// Checks if the [StudentAssignmentsFilterState] object is equal to another object.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentAssignmentsFilterState &&
        other.isPending == isPending &&
        other.isPassed == isPassed &&
        other.isFailed == isFailed &&
        other.isNotSubmitted == isNotSubmitted &&
        other.firstSubmission == firstSubmission &&
        other.lastSubmission == lastSubmission &&
        other.query == query;
  }

  /// Returns the hash code of the [StudentAssignmentsFilterState] object.
  @override
  int get hashCode {
    return isPending.hashCode ^
        isPassed.hashCode ^
        isFailed.hashCode ^
        isNotSubmitted.hashCode ^
        firstSubmission.hashCode ^
        lastSubmission.hashCode ^
        query.hashCode;
  }
}

/// Immutable class that represents the state of the filter for Teacher assignments.
@immutable
class TeacherAssignmentsFilterState {
  /// Whether the assignment is pending.
  final bool isActive;

  /// Whether the assignment is passed.
  final bool isExpired;

  /// Search Query
  final String? query;

  /// Constructor for the [TeacherAssignmentsFilterState] class.
  const TeacherAssignmentsFilterState({
    this.isActive = false,
    this.isExpired = false,
    this.query,
  });

  /// Returns a new instance of [TeacherAssignmentsFilterState] with the specified properties.
  TeacherAssignmentsFilterState copyWith({
    bool? isActive,
    bool? isExpired,
    required String? query,
  }) {
    return TeacherAssignmentsFilterState(
      isActive: isActive ?? this.isActive,
      isExpired: isExpired ?? this.isExpired,
      query: query,
    );
  }

  /// Returns a string representation of the [TeacherAssignmentsFilterState] object.
  @override
  String toString() {
    return 'TeacherAssignmentsFilterState(isActive: $isActive, isExpired: $isExpired, query: $query)';
  }

  /// Checks if the [TeacherAssignmentsFilterState] object is equal to another object.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TeacherAssignmentsFilterState &&
        other.isActive == isActive &&
        other.isExpired == isExpired &&
        other.query == query;
  }

  /// Returns the hash code of the [TeacherAssignmentsFilterState] object.
  @override
  int get hashCode {
    return isActive.hashCode ^ isExpired.hashCode ^ query.hashCode;
  }
}
