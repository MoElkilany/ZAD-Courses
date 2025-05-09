import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/entities/student/quiz_result.dart';

part 'quiz_submission_detials_student.g.dart';

/// A Riverpod provider class for managing the Submissions of a student assignment.
@Riverpod(keepAlive: true)
class QuizSubmissionDetailsStudent extends _$QuizSubmissionDetailsStudent {
  /// Overrides the default build method of the provider.
  /// Returns null as this provider does not have a UI representation.
  @override
  QuizResult? build() {
    return null;
  }

  /// Sets the current student assignment to the provided [assignment].
  void setQuiz(QuizResult quiz) {
    state = quiz;
  }

  /// Returns the current student assignment.
  get quiz => state;
}
