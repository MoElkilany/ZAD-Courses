import 'package:flutter/foundation.dart';

@immutable
class QuizResultsFilterStateStudent {
  final String? courseClass;

  final String? query;

  final bool isWaiting;
  final bool isPassed;
  final bool isFailed;

  const QuizResultsFilterStateStudent({
    this.courseClass,
    this.query,
    this.isWaiting = false,
    this.isPassed = false,
    this.isFailed = false,
  });

  QuizResultsFilterStateStudent copyWith({
    required String? courseClass,
    required String? query,
    required bool isWaiting,
    required bool isPassed,
    required bool isFailed,
  }) {
    return QuizResultsFilterStateStudent(
      courseClass: courseClass,
      query: query,
      isWaiting: isWaiting,
      isPassed: isPassed,
      isFailed: isFailed,
    );
  }

  @override
  String toString() =>
      'QuizResultsFilterStateStudent(courseClass: $courseClass, query: $query, isWaiting: $isWaiting, isPassed: $isPassed, isFailed: $isFailed)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuizResultsFilterStateStudent &&
        other.courseClass == courseClass &&
        other.query == query &&
        other.isWaiting == isWaiting &&
        other.isPassed == isPassed &&
        other.isFailed == isFailed;
  }

  @override
  int get hashCode =>
      courseClass.hashCode ^
      query.hashCode ^
      isWaiting.hashCode ^
      isPassed.hashCode ^
      isFailed.hashCode;
}
