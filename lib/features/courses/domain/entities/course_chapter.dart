import 'package:equatable/equatable.dart';
import 'course_assignment.dart';
import 'course_file.dart';
import 'course_office_hours.dart';
import 'course_session.dart';
import 'course_text.dart';

/// A class that represents a chapter in a course.
class CourseChapter extends Equatable {
  /// The unique identifier of the chapter.
  final int id;

  /// The title of the chapter.
  final String title;

  /// The list of sessions in the chapter.
  final List<CourseSession> sessions;

  /// The list of office hours in the chapter.
  final List<CourseOfficeHours> officeHours;

  /// The list of files in the chapter.
  final List<CourseFile> files;

  /// The list of texts in the chapter.
  final List<CourseText> texts;

  /// The list of assignments in the chapter.
  final List<CourseAssignment> assignments;

  /// Creates a new instance of [CourseChapter].
  const CourseChapter({
    required this.id,
    required this.title,
    required this.sessions,
    required this.officeHours,
    required this.files,
    required this.texts,
    required this.assignments,
  });

  @override
  List<Object?> get props => [id, title, sessions, files, texts, assignments];
}
