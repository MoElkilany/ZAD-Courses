import 'quiz_submission_teacher_model.dart';
import '../../../domain/entities/teacher/quiz_submissions__list_teacher.dart';

class QuizSubmissionsListTeacherModel extends QuizSubmissionsListTeacher {
  const QuizSubmissionsListTeacherModel({
    required super.quizId,
    required super.submissions,
  });

  factory QuizSubmissionsListTeacherModel.fromJson(Map<String, dynamic> json, List<Map<String, dynamic>> resultsList) =>
      QuizSubmissionsListTeacherModel(
        quizId: json['quiz_id'],
        submissions: List<QuizSubmissionTeacherModel>.from(
          resultsList.map(
            (x) => QuizSubmissionTeacherModel.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        'quiz_id': quizId,
        'submissions': List<dynamic>.from(
          submissions.map(
            // model from object
            (x) {
              final model = QuizSubmissionTeacherModel(
                userId: x.userId,
                userName: x.userName,
                userAvatar: x.userAvatar,
                userEmail: x.userEmail,
                quizId: x.quizId,
                status: x.status,
                submissionDate: x.submissionDate,
                reviewerDeadline: x.reviewerDeadline,
                userAttempts: x.userAttempts,
                totalAttempts: x.totalAttempts,
                quizTitle: x.quizTitle,
                courseTitle: x.courseTitle,
                totalMark: x.totalMark,
                maxMark: x.maxMark,
                passMark: x.passMark,
              );
              return model.toJson();
            },
          ),
        ),
      };
}
