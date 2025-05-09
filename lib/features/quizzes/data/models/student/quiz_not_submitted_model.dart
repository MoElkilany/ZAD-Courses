import '../../../domain/entities/student/quiz_not_submitted.dart';

class QuizNotSubmittedModel extends QuizNotSubmitted {
  const QuizNotSubmittedModel({
    required super.id,
    required super.title,
    required super.courseTitle,
    required super.questionCount,
    required super.quizTime,
    required super.maxMark,
    required super.dueDate,
  });

  factory QuizNotSubmittedModel.fromJson(Map<String, dynamic> json) => QuizNotSubmittedModel(
        id: json['id'],
        title: json['title'],
        courseTitle: json['course']['title'],
        questionCount: json['question_count'],
        quizTime: json['time'],
        maxMark: json['total_mark'],
        dueDate: json['due_date'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'course_title': courseTitle,
        'question_count': questionCount,
        'quiz_time': quizTime,
        'max_mark': maxMark,
        'due_date': dueDate,
      };
}
