// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'assignment.dart';
import 'quiz.dart';
import 'session.dart';

class Progress {
  List<Assignment> assignments;
  List<Quiz> quizzes;
  List<Session> sessions;
  Progress({
    required this.assignments,
    required this.quizzes,
    required this.sessions,
  });
}
