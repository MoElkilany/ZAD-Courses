import 'package:flutter/foundation.dart';

/// Immutable class that represents the state of the filter for student assignments.
@immutable
class FinancialFilterState {
  /// The date of the first submission.
  final DateTime? firstSubmission;

  /// The date of the last submission.
  final DateTime? lastSubmission;

  /// Search Query
  final String? query;

  /// is addition
  final bool isAddition;

  /// is Deduction
  final bool isDeduction;

  /// Constructor for the [FinancialFilterState] class.
  const FinancialFilterState({
    this.firstSubmission,
    this.lastSubmission,
    this.query,
    this.isAddition = false,
    this.isDeduction = false,
  });

  /// Returns a new instance of [FinancialFilterState] with the specified properties.
  FinancialFilterState copyWith({
    required DateTime? firstSubmission,
    required DateTime? lastSubmission,
    required String? query,
    bool? isAddition,
    bool? isDeduction,
  }) {
    return FinancialFilterState(
      firstSubmission: firstSubmission,
      lastSubmission: lastSubmission,
      query: query,
      isAddition: isAddition ?? this.isAddition,
      isDeduction: isDeduction ?? this.isDeduction,
    );
  }

  /// Returns a string representation of the [FinancialFilterState] object.
  @override
  String toString() {
    return 'NoticeboardFilterState(firstSubmission: $firstSubmission, lastSubmission: $lastSubmission, query: $query, isAddition: $isAddition, isDeduction: $isDeduction)';
  }

  /// Checks if the [FinancialFilterState] object is equal to another object.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FinancialFilterState &&
        other.firstSubmission == firstSubmission &&
        other.lastSubmission == lastSubmission &&
        other.query == query &&
        other.isAddition == isAddition &&
        other.isDeduction == isDeduction;
  }

  /// Returns the hash code of the [FinancialFilterState] object.
  @override
  int get hashCode {
    return firstSubmission.hashCode ^ lastSubmission.hashCode ^ query.hashCode ^ isAddition.hashCode ^ isDeduction.hashCode;
  }
}
