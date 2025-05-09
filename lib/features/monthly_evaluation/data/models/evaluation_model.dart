import 'dart:convert';

import '../../domain/entities/evaluation.dart';

class EvaluationModel extends MonthlyEvaluation {
  EvaluationModel({
    required super.id,
    required super.topics,
    required super.notes,
    required super.hints,
    required super.courseId,
    required super.creatorId,
    required super.teacherId,
    required super.studentId,
    required super.createdAt,
    required super.updatedAt,
    required super.hasQuizComment,
  });

  factory EvaluationModel.fromJson(Map<String, dynamic> jsonModel) {
    return EvaluationModel(
      id: jsonModel['id'],
      topics: (json.decode(jsonModel['topics']) as List).cast<String>(),
      notes: jsonModel['notes'],
      hints: jsonModel['hints'],
      courseId: jsonModel['course_id'],
      creatorId: jsonModel['creator_id'],
      teacherId: jsonModel['teacher_id'],
      studentId: jsonModel['student_id'],
      createdAt: DateTime.parse(jsonModel['created_at']),
      updatedAt: DateTime.parse(jsonModel['updated_at']),
      hasQuizComment: jsonModel['has_quiz_comment'],
    );
  }
}
