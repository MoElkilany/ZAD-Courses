import 'package:equatable/equatable.dart';

/// Represents a course file entity.
class CourseFile extends Equatable {
  /// The title of the course file.
  final String title;

  /// The URL of the course file.
  final String url;

  /// The volume of the course file.
  final String volume;

  /// The file type of the course file.
  final String fileType;

  /// Creates a new instance of [CourseFile].
  const CourseFile({
    required this.title,
    required this.url,
    required this.volume,
    required this.fileType,
  });

  @override
  List<Object?> get props => [title, url, volume, fileType];
}
