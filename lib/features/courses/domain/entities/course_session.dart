import 'package:equatable/equatable.dart';

/// A class representing a course session entity.
class CourseSession extends Equatable {
  /// session id
  final int id;

  /// The title of the course session.
  final String title;

  /// The URL of the course session.
  final String url;

  /// The status of the course session.
  final String status;

  /// The date of the course session.
  final DateTime date;

  /// Creates a new instance of [CourseSession].
  const CourseSession({
    required this.title,
    required this.url,
    required this.status,
    required this.date,
    required this.id,
  });

  @override
  List<Object?> get props => [title, url, status, date, id];
}
