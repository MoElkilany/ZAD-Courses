import 'package:equatable/equatable.dart';

/// A class representing a course text entity.
class CourseText extends Equatable {
  /// The title of the course text.
  final String title;

  /// The URL of the course text.
  final String url;

  /// The volume of the course text.
  final String summary;

  /// The file type of the course text.
  final String image;

  /// Creates a new instance of [CourseText].
  ///
  /// [title], [url], [summary], and [image] are required parameters.
  const CourseText({
    required this.title,
    required this.url,
    required this.summary,
    required this.image,
  });

  @override
  List<Object?> get props => [title, url, summary, image];
}
