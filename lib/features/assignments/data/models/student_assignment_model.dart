import 'package:intl/intl.dart';

import 'student_attachment_model.dart';
import '../../domain/entities/student_assignment.dart';
import '../../domain/entities/student_attachment.dart';

/// A model class that extends the [StudentAssignment] entity class and adds additional functionality.
class StudentAssignmentModel extends StudentAssignment {
  static final _format = DateFormat('dd MM yyyy | h:mm a');
  //super constructor
  /// A constructor that initializes the [StudentAssignmentModel] object with the given parameters.
  const StudentAssignmentModel({
    required super.id,
    required super.title,
    required super.description,
    required super.courseName,
    required super.className,
    required super.status,
    required super.deadline,
    required super.firstSubmission,
    required super.lastSubmission,
    required super.attempts,
    required super.maxAttempts,
    required super.grade,
    required super.minGrade,
    required super.maxGrade,
    required super.attachments,
  });

  //from json constructor
  /// A factory constructor that creates a [StudentAssignmentModel] object from a JSON map.
  factory StudentAssignmentModel.fromJson(Map<String, dynamic> json) {
    return StudentAssignmentModel(
        id: json['id'],
        title: json['title'],
        status: json['user_status'],
        description: json['description'] ?? '',
        courseName: json['course_title'],
        className: json['classTitle'] ?? '',
        deadline: _format.tryParse(json['deadline']),
        firstSubmission: json['first_submission'] == null ? null : _format.tryParse(json['first_submission']),
        lastSubmission: json['last_submission'] == null ? null : _format.tryParse(json['last_submission']),
        attempts: json['used_attempts_count'],
        maxAttempts: json['attempts'],
        grade: json['grade'],
        minGrade: json['pass_grade'],
        maxGrade: json['total_grade'],
        attachments: json['attachments'].map<StudentAttachment>((e) {
          final model = StudentAttachmentModel.fromJson(e);
          return StudentAttachment(
            name: model.name,
            url: model.url,
          );
        }).toList());
  }

  //to json method
  /// A method that converts the [StudentAssignmentModel] object to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'user_status': status,
      'description': description,
      'course_title': courseName,
      'classTitle': className,
      'deadline': deadline == null ? null : _format.format(deadline!),
      'first_submission': firstSubmission == null ? null : _format.format(firstSubmission!),
      'last_submission': lastSubmission == null ? null : _format.format(lastSubmission!),
      'used_attempts_count': attempts,
      'attempts': maxAttempts,
      'grade': grade,
      'pass_grade': minGrade,
      'total_grade': maxGrade,
      'attachments': attachments.map((e) {
        final model = StudentAttachmentModel(
          name: e.name,
          url: e.url,
        );
        return model.toJson();
      }).toList(),
    };
  }
}
