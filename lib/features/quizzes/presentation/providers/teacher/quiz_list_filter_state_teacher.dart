import 'package:flutter/foundation.dart';

@immutable
class QuizListFilterStateTeacher {
  final String? courseClass;

  final String? query;

  final bool isActive;
  final bool isExpired;

  const QuizListFilterStateTeacher({
    this.courseClass,
    this.query,
    this.isActive = false,
    this.isExpired = false,
  });

  QuizListFilterStateTeacher copyWith({
    required String? courseClass,
    required String? query,
    required bool isActive,
    required bool isExpired,
  }) {
    return QuizListFilterStateTeacher(
      courseClass: courseClass,
      query: query,
      isActive: isActive,
      isExpired: isExpired,
    );
  }

  @override
  String toString() =>
      'QuizListFilterStateTeacher(courseClass: $courseClass, query: $query, isActive: $isActive, isExpired: $isExpired)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuizListFilterStateTeacher &&
        other.courseClass == courseClass &&
        other.query == query &&
        other.isActive == isActive &&
        other.isExpired == isExpired;
  }

  @override
  int get hashCode =>
      courseClass.hashCode ^
      query.hashCode ^
      isActive.hashCode ^
      isExpired.hashCode;
}
