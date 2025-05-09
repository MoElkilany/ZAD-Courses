import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_submissions_detials_teacher.g.dart';

/// A Riverpod provider class for managing the Submissions of a student assignment.
@Riverpod(keepAlive: true)
class QuizSubmissionsDetailsTeacher extends _$QuizSubmissionsDetailsTeacher {
  /// Overrides the default build method of the provider.
  /// Returns null as this provider does not have a UI representation.
  @override
  int? build() {
    return null;
  }

  /// Sets the current student assignment to the provided [assignment].
  void setQuiz(int quiz) {
    state = quiz;
  }

  /// Returns the current student assignment.
  get quiz => state;
}
