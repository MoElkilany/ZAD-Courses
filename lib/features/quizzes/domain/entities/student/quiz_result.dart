import 'package:equatable/equatable.dart';

class QuizResult extends Equatable {
  final int id;
  final String title;
  final int? totalMark;
  final int? passMark;
  final int? maxMark;
  final String status;
  final String courseTitle;
  final DateTime? submissionDate;
  final String? dueDate;
  final int? userAttempts;
  final int? totalAttempts;

  const QuizResult({
    required this.id,
    required this.title,
    required this.totalMark,
    required this.passMark,
    required this.maxMark,
    required this.status,
    required this.courseTitle,
    required this.submissionDate,
    required this.dueDate,
    required this.userAttempts,
    required this.totalAttempts,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        totalMark,
        passMark,
        maxMark,
        status,
        courseTitle,
        submissionDate,
        dueDate,
      ];
}
