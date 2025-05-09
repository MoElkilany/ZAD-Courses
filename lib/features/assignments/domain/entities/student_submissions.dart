import 'package:equatable/equatable.dart';
import 'student_attachment.dart';

/// A class representing a teacher assignment entity.
class StudentSubmission extends Equatable {
  /// The unique identifier of the assignment.
  final int id;

  /// The title of the assignment.
  final String title;

  /// The course which the assignment is under.
  final String courseTitle;

  //Description of the assignment
  final String description;

  /// The max number of submissions for this assignment.
  final int? maxAttempts;

  /// The number of submissions for this assignment.
  final int? attempts;

  /// The grade received by the student for the assignment.
  final int? grade;

  /// The minimum grade required to pass the assignment.
  final int? minGrade;

  /// The maximum grade that can be received for the assignment.
  final int? maxGrade;

  /// Assignment status.
  final String studentStatus;

  /// The deadline of the assignment.
  final DateTime? deadline;

  /// The URL of the attachment for the assignment (if any).
  final List<StudentAttachment> attachments;

  /// Student id
  final int studentId;

  /// Student Name
  final String studentName;

  /// Student Email
  final String studentEmail;

  /// Student avatar
  final String studentAvatar;

  /// Last submission date
  final DateTime? lastSubmissionDate;

  /// Creates a new instance of [TeacherAssignment].
  const StudentSubmission({
    required this.id,
    required this.title,
    required this.courseTitle,
    required this.maxAttempts,
    required this.studentStatus,
    required this.deadline,
    required this.description,
    required this.attempts,
    required this.grade,
    required this.minGrade,
    required this.maxGrade,
    required this.attachments,
    required this.studentId,
    required this.studentName,
    required this.studentEmail,
    required this.studentAvatar,
    required this.lastSubmissionDate,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        courseTitle,
        maxAttempts,
        studentStatus,
        deadline,
        description,
        attempts,
        grade,
        minGrade,
        maxGrade,
        attachments,
        studentId,
        studentName,
        studentEmail,
        studentAvatar,
        lastSubmissionDate,
      ];
}
