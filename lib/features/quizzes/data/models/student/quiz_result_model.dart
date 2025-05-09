import '../../../domain/entities/student/quiz_result.dart';

class QuizResultModel extends QuizResult {
  const QuizResultModel({
    required super.id,
    required super.title,
    required super.totalMark,
    required super.passMark,
    required super.maxMark,
    required super.status,
    required super.courseTitle,
    required super.submissionDate,
    required super.dueDate,
    required super.userAttempts,
    required super.totalAttempts,
  });

  factory QuizResultModel.fromJson(Map<String, dynamic> json) => QuizResultModel(
        id: json['id'],
        title: json['quiz']['title'],
        totalMark: json['user_grade'],
        passMark: json['quiz']['pass_mark'],
        maxMark: json['quiz']['total_mark'],
        userAttempts: json['user_attempts'],
        totalAttempts: json['total_attempts'],
        status: json['status'],
        courseTitle: json['quiz']['course']['title'],
        submissionDate: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
        dueDate: json['quiz']['due_date'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'total_mark': totalMark,
        'pass_mark': passMark,
        'max_mark': maxMark,
        'status': status,
        'course_title': courseTitle,
        'submission_date': submissionDate?.toIso8601String(),
        'due_date': dueDate,
      };
}
