import 'package:flutter/foundation.dart';

@immutable
class QuizNotSubmittedFilterStateStudent {
  final String? courseClass;

  final String? query;

  const QuizNotSubmittedFilterStateStudent({
    this.courseClass,
    this.query,
  });

  QuizNotSubmittedFilterStateStudent copyWith({
    required String? courseClass,
    required String? query,
  }) {
    return QuizNotSubmittedFilterStateStudent(
      courseClass: courseClass,
      query: query,
    );
  }

  @override
  String toString() =>
      'QuizNotSubmittedFilterStateStudent(courseClass: $courseClass, query: $query)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuizNotSubmittedFilterStateStudent &&
        other.courseClass == courseClass &&
        other.query == query;
  }

  @override
  int get hashCode => courseClass.hashCode ^ query.hashCode;
}
