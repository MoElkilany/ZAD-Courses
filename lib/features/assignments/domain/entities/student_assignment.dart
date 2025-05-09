import 'package:equatable/equatable.dart';
import 'student_attachment.dart';

/// Represents a student assignment entity.
class StudentAssignment extends Equatable {
  /// The unique identifier of the assignment.
  final int id;

  /// The title of the assignment.
  final String title;

  /// The description of the assignment.
  final String description;

  /// The name of the course the assignment belongs to.
  final String courseName;

  /// The name of the class the assignment belongs to.
  final String className;

  /// The status of the assignment (e.g. "passed", "pending", "failed").
  final String status;

  /// The deadline for the assignment.
  final DateTime? deadline;

  /// The date and time of the first submission for the assignment.
  final DateTime? firstSubmission;

  /// The date and time of the last submission for the assignment.
  final DateTime? lastSubmission;

  /// The number of attempts made by the student for the assignment.
  final int? attempts;

  /// The maximum number of attempts allowed for the assignment.
  final int? maxAttempts;

  /// The grade received by the student for the assignment.
  final int? grade;

  /// The minimum grade required to pass the assignment.
  final int? minGrade;

  /// The maximum grade that can be received for the assignment.
  final int? maxGrade;

  /// The URL of the attachment for the assignment (if any).
  final List<StudentAttachment> attachments;

  /// Creates a new instance of the [StudentAssignment] class.
  const StudentAssignment({
    required this.id,
    required this.title,
    required this.description,
    required this.courseName,
    required this.className,
    required this.status,
    required this.deadline,
    required this.firstSubmission,
    required this.lastSubmission,
    required this.attempts,
    required this.maxAttempts,
    required this.grade,
    required this.minGrade,
    required this.attachments,
    required this.maxGrade,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        courseName,
        className,
        status,
        deadline,
        firstSubmission,
        lastSubmission,
        attempts,
        maxAttempts,
        grade,
        minGrade,
        attachments,
        maxGrade,
      ];
}
