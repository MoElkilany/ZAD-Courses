import 'package:intl/intl.dart';

import '../../../domain/entities/teacher/quiz_teacher.dart';

class QuizTeacherModel extends QuizTeacher {
  static final _format = DateFormat('dd MMM yyyy HH:mm');

  const QuizTeacherModel({
    required super.quizId,
    required super.quizTitle,
    required super.courseTitle,
    required super.status,
    required super.dueDate,
    required super.dateCreated,
    required super.totalMark,
    required super.successRate,
  });

  factory QuizTeacherModel.fromJson(Map<String, dynamic> json) {
    final dueDate = _format.parse(json["due_date"]);

    return QuizTeacherModel(
      quizId: json['id'],
      quizTitle: json['title'],
      courseTitle: json['course']['title'],
      status: dueDate.isAfter(DateTime.now()) ? 'active' : 'expired',
      dueDate: _format.format(dueDate),
      dateCreated: json['created_at'],
      totalMark: json['total_mark'],
      successRate: json['success_rate'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': quizId,
        'title': quizTitle,
        'course_title': courseTitle,
        'status': status,
        'due_date': dueDate,
        'created_at': dateCreated,
        'total_mark': totalMark,
      };
}
