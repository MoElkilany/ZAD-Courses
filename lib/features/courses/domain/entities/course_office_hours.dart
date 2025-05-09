import 'package:equatable/equatable.dart';

/// A class that represents the office hours of a course.
class CourseOfficeHours extends Equatable {
  /// The id of the office hours.
  final int id;

  /// The title of the office hours.
  final String title;

  /// The URL of the office hours.
  final String url;

  /// The status of the office hours.
  final String status;

  /// The date of the office hours.
  final DateTime date;

  /// Creates a new instance of [CourseOfficeHours].
  const CourseOfficeHours({
    required this.id,
    required this.title,
    required this.url,
    required this.status,
    required this.date,
  });

  @override
  List<Object?> get props => [title, url, status, date, id];
}
