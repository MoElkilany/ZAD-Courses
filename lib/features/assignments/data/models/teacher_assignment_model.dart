import 'package:intl/intl.dart';

import '../../domain/entities/teacher_assignment.dart';

/// A model class that extends the [TeacherAssignment] entity class.
class TeacherAssignmentModel extends TeacherAssignment {
  static final _format = DateFormat('dd MMM yyyy | hh:mm');

  /// A constructor that initializes the [TeacherAssignmentModel] object with the given parameters.
  const TeacherAssignmentModel({
    required super.id,
    required super.title,
    required super.courseTitle,
    required super.numSubmissions,
    required super.status,
    required super.dueDate,
  });

  /// A factory constructor that creates a [TeacherAssignmentModel] object from a JSON map.
  factory TeacherAssignmentModel.fromJson(Map<String, dynamic> json) {
    final dueDate = _format.parse(json["deadline"]);
    return TeacherAssignmentModel(
      id: json['id'],
      title: json['title'],
      courseTitle: json['course_title'],
      numSubmissions: json['submissions_count'],
      status: json['status'], //dueDate.isAfter(DateTime.now()) ? 'active' : 'expired',
      dueDate: _format.format(dueDate),
    );
  }

  /// A method that converts a [TeacherAssignmentModel] object to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'course_title': courseTitle,
      'submissions_count': numSubmissions,
      'status': status,
      'due_date': dueDate,
    };
  }
}
