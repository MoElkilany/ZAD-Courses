import 'package:equatable/equatable.dart';
import 'quiz_submissions__list_teacher.dart';
import 'quiz_teacher.dart';

class QuizzesListTeacher extends Equatable {
  final List<QuizSubmissionsListTeacher> quizzesSubmissionsLists;
  final List<QuizTeacher> quizzesList;

  const QuizzesListTeacher({
    required this.quizzesSubmissionsLists,
    required this.quizzesList,
  });

  @override
  List<Object?> get props => [
        quizzesSubmissionsLists,
        quizzesList,
      ];
}
