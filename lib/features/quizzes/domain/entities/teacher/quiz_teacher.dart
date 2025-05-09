import 'package:equatable/equatable.dart';

class QuizTeacher extends Equatable {
  final int quizId;
  final String quizTitle;
  final String courseTitle;
  final String status;
  final String dueDate;
  final String dateCreated;
  final int? totalMark;
  final int successRate;

  const QuizTeacher({
    required this.quizId,
    required this.quizTitle,
    required this.courseTitle,
    required this.status,
    required this.dueDate,
    required this.dateCreated,
    required this.totalMark,
    required this.successRate,
  });

  @override
  List<Object?> get props => [
        quizId,
        quizTitle,
        courseTitle,
        status,
        dueDate,
        dateCreated,
        totalMark,
      ];
}
