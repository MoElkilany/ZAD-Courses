import 'package:equatable/equatable.dart';

class QuizSubmissionTeacher extends Equatable {
  final int userId;
  final String userName;
  final String? userAvatar;
  final String userEmail;
  final int quizId;
  final String status;
  final DateTime? submissionDate;
  final String reviewerDeadline;
  final int? userAttempts;
  final int? totalAttempts;

  final String quizTitle;
  final String courseTitle;
  final int? totalMark;
  final int? maxMark;
  final int? passMark;

  const QuizSubmissionTeacher({
    required this.userId,
    required this.userName,
    required this.quizId,
    required this.userAvatar,
    required this.userEmail,
    required this.status,
    required this.reviewerDeadline,
    required this.submissionDate,
    required this.userAttempts,
    required this.totalAttempts,
    required this.quizTitle,
    required this.courseTitle,
    required this.totalMark,
    required this.maxMark,
    required this.passMark,
  });

  @override
  List<Object?> get props => [
        userId,
        userName,
        quizId,
        userAvatar,
        userEmail,
        status,
        submissionDate,
        reviewerDeadline,
      ];
}
