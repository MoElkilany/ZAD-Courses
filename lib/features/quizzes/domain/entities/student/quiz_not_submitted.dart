import 'package:equatable/equatable.dart';

class QuizNotSubmitted extends Equatable {
  final int id;
  final String title;
  final String courseTitle;
  final int? questionCount;
  final int? quizTime;
  final int? maxMark;
  final String? dueDate;

  const QuizNotSubmitted({
    required this.id,
    required this.title,
    required this.courseTitle,
    required this.questionCount,
    required this.quizTime,
    required this.maxMark,
    required this.dueDate,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        courseTitle,
        questionCount,
        quizTime,
        maxMark,
        dueDate,
      ];
}
