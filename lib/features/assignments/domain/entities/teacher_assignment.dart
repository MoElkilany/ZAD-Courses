import 'package:equatable/equatable.dart';

/// A class representing a teacher assignment entity.
class TeacherAssignment extends Equatable {
  /// The unique identifier of the assignment.
  final int id;

  /// The title of the assignment.
  final String title;

  /// The course which the assignment is under.
  final String courseTitle;

  /// The number of submissions for this assignment.
  final int numSubmissions;

  /// Assignment status.
  final String status;

  /// The deadline of the assignment.
  final String? dueDate;

  /// Creates a new instance of [TeacherAssignment].
  const TeacherAssignment({
    required this.id,
    required this.title,
    required this.courseTitle,
    required this.numSubmissions,
    required this.status,
    required this.dueDate,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        courseTitle,
        numSubmissions,
        status,
        dueDate,
      ];
}
