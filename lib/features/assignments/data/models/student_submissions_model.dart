import 'package:intl/intl.dart';

import '../../domain/entities/student_attachment.dart';
import '../../domain/entities/student_submissions.dart';
import '../../domain/entities/teacher_assignment.dart';
import 'student_attachment_model.dart';

/// A model class that extends the [TeacherAssignment] entity class.
class StudentSubmissionsModel extends StudentSubmission {
  static final _format = DateFormat('dd MM yyyy | h:mm a');

  /// A constructor that initializes the [TeacherAssignmentModel] object with the given parameters.
  const StudentSubmissionsModel({
    required super.id,
    required super.title,
    required super.courseTitle,
    required super.deadline,
    required super.description,
    required super.maxAttempts,
    required super.attempts,
    required super.grade,
    required super.minGrade,
    required super.maxGrade,
    required super.studentStatus,
    required super.attachments,
    required super.studentId,
    required super.studentName,
    required super.studentEmail,
    required super.studentAvatar,
    required super.lastSubmissionDate,
  });

  /// A factory constructor that creates a [TeacherAssignmentModel] object from a JSON map.
  factory StudentSubmissionsModel.fromJson(Map<String, dynamic> json) {
    return StudentSubmissionsModel(
      id: json['id'],
      title: json['title'],
      courseTitle: json['course_title'],
      deadline: json['deadline'] == null ? null : _format.parse(json['deadline']),
      description: json['description'],
      maxAttempts: json['attempts'],
      attempts: json['used_attempts_count'],
      grade: json['grade'],
      minGrade: json['pass_grade'],
      maxGrade: json['total_grade'],
      studentStatus: json['user_status'],
      attachments: json['attachments'].map<StudentAttachment>((attachment) => StudentAttachmentModel.fromJson(attachment)).toList(),
      studentId: json['student']['id'],
      studentName: json['student']['full_name'],
      studentEmail: json['student']['email'],
      studentAvatar: json['student']['avatar'],
      lastSubmissionDate: json['last_submission'] == null ? null : _format.parse(json['last_submission']),
    );
  }

  /// A method that converts a [TeacherAssignmentModel] object to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'course_title': courseTitle,
      'deadline': deadline.toString(),
      'description': description,
      'attempts': maxAttempts,
      'used_attempts_count': attempts,
      'grade': grade,
      'pass_grade': minGrade,
      'total_grade': maxGrade,
      'user_status': studentStatus,
    };
  }
}
