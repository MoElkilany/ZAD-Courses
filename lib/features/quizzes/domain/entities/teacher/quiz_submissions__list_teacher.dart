import 'package:equatable/equatable.dart';
import 'quiz_submission_teacher.dart';

class QuizSubmissionsListTeacher extends Equatable {
  final int quizId;
  final List<QuizSubmissionTeacher> submissions;

  const QuizSubmissionsListTeacher({
    required this.quizId,
    required this.submissions,
  });

  @override
  List<Object?> get props => [
        quizId,
        submissions,
      ];
}
