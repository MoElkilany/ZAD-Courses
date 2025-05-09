import '../../../domain/entities/teacher/quiz_submission_teacher.dart';

class QuizSubmissionTeacherModel extends QuizSubmissionTeacher {
  const QuizSubmissionTeacherModel({
    required super.userId,
    required super.userName,
    required super.userAvatar,
    required super.userEmail,
    required super.quizId,
    required super.status,
    required super.submissionDate,
    required super.reviewerDeadline,
    required super.userAttempts,
    required super.totalAttempts,
    required super.quizTitle,
    required super.courseTitle,
    required super.totalMark,
    required super.maxMark,
    required super.passMark,
  });

  factory QuizSubmissionTeacherModel.fromJson(Map<String, dynamic> json) => QuizSubmissionTeacherModel(
        userId: json['user']['id'],
        userName: json['user']['full_name'],
        userAvatar: json['user']['avatar'],
        userEmail: json['user']['email'],
        quizId: json['quiz']['id'],
        status: json['status'],
        userAttempts: json['user_attempts'],
        totalAttempts: json['total_attempts'],
        submissionDate: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
        reviewerDeadline: json['quiz']['reviewer_deadline'],
        quizTitle: json['quiz']['title'],
        courseTitle: json['quiz']['course']['title'],
        totalMark: json['user_grade'],
        passMark: json['quiz']['pass_mark'],
        maxMark: json['quiz']['total_mark'],
      );

  Map<String, dynamic> toJson() => {
        'user': {
          'id': userId,
          'name': userName,
          'avatar': userAvatar,
          'email': userEmail,
        },
        'quiz_id': quizId,
        'status': status,
        'created_at': submissionDate?.toIso8601String(),
        'reviewer_deadline': reviewerDeadline,
      };
}
