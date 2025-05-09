import 'package:flutter/foundation.dart';

/// Immutable class that represents the state of the filter for student assignments.
@immutable
class PlatformFilterState {
  /// Whether the assignment is pending.
  final bool isReplied;

  /// Whether the assignment is passed.
  final bool isOpen;

  /// Whether the assignment is failed.
  final bool isClosed;

  /// The date of the first submission.
  final DateTime? firstSubmission;

  /// The date of the last submission.
  final DateTime? lastSubmission;

  /// Constructor for the [PlatformFilterState] class.
  const PlatformFilterState({
    this.isReplied = false,
    this.isOpen = false,
    this.isClosed = false,
    this.firstSubmission,
    this.lastSubmission,
  });

  /// Returns a new instance of [PlatformFilterState] with the specified properties.
  PlatformFilterState copyWith({
    bool? isReplied,
    bool? isOpen,
    bool? isClosed,
    DateTime? firstSubmission,
    DateTime? lastSubmission,
    String? course,
    String? userType,
  }) {
    return PlatformFilterState(
      isReplied: isReplied ?? this.isReplied,
      isOpen: isOpen ?? this.isOpen,
      isClosed: isClosed ?? this.isClosed,
      firstSubmission: firstSubmission,
      lastSubmission: lastSubmission,
    );
  }

  /// Returns a string representation of the [PlatformFilterState] object.
  @override
  String toString() {
    return 'PlatformFilterState(isReplied: $isReplied, isOpen: $isOpen, isClosed: $isClosed, firstSubmission: $firstSubmission, lastSubmission: $lastSubmission)';
  }

  /// Checks if the [PlatformFilterState] object is equal to another object.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PlatformFilterState &&
        other.isReplied == isReplied &&
        other.isOpen == isOpen &&
        other.isClosed == isClosed &&
        other.firstSubmission == firstSubmission &&
        other.lastSubmission == lastSubmission;
  }

  /// Returns the hash code of the [PlatformFilterState] object.
  @override
  int get hashCode {
    return isReplied.hashCode ^
        isOpen.hashCode ^
        isClosed.hashCode ^
        firstSubmission.hashCode ^
        lastSubmission.hashCode;
  }
}
