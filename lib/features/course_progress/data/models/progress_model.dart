import '../../domain/entities/progress.dart';
import 'assignment.dart';
import 'quiz.dart';
import 'session.dart';

class ProgressModel extends Progress {
  ProgressModel({
    required super.assignments,
    required super.quizzes,
    required super.sessions,
  });

  factory ProgressModel.fromJson(Map<String, dynamic> json) {
    final attendence = (json['attendance'] as List).map((e) => e['session_id']).toSet();
    return ProgressModel(
      assignments: (json['assignments'] as Map).values.map((j) {
        if (j is Map) {
          return AssignmentModel.fromJson({
            ...j,
            'status': 'not_submitted',
          });
        } else {
          final v = (j as List)[0];
          return AssignmentModel.fromJson({
            ...v['assignment'],
            'status': v['status'],
          });
        }
      }).toList(),
      quizzes: (json['quizzes'] as Map).values.map((j) {
        if (j is Map) {
          return QuizModel.fromJson({
            ...j,
            'status': 'not_submitted',
          });
        } else {
          final v = (j as List)[0];
          return QuizModel.fromJson({
            ...v['quiz'],
            'status': v['status'],
          });
        }
      }).toList(),
      sessions: (json['sessions'] as List).map((j) {
        return SessionModel.fromJson({
          ...j,
          'status': attendence.contains(j['id']),
        });
      }).toList(),
    );
  }
}
