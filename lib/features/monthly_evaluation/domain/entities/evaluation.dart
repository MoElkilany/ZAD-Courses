//ticket request entity

class MonthlyEvaluation {
  final int id;
  final List<String> topics;
  final String notes;
  final String hints;
  final int courseId;
  final int creatorId;
  final int teacherId;
  final int studentId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String hasQuizComment;

  MonthlyEvaluation({
    required this.id,
    required this.topics,
    required this.notes,
    required this.hints,
    required this.courseId,
    required this.creatorId,
    required this.teacherId,
    required this.studentId,
    required this.createdAt,
    required this.updatedAt,
    required this.hasQuizComment,
  });
}
