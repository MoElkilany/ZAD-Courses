import '../../domain/entities/course_file.dart';

/// A model class that represents a course file.
class CourseFileModel extends CourseFile {
  /// Constructs a [CourseFileModel] instance.
  ///
  /// [title], [url], [volume], and [fileType] are required parameters.
  const CourseFileModel({
    required super.title,
    required super.url,
    required super.volume,
    required super.fileType,
  });

  /// Constructs a [CourseFileModel] instance from a JSON map.
  ///
  /// The JSON map must contain the following keys: 'title', 'url', 'volume', and 'fileType'.
  factory CourseFileModel.fromJson(Map<String, dynamic> json) {
    return CourseFileModel(
      title: json['translations'][0]['title'],
      url: json['file'],
      volume: json['volume'],
      fileType: json['file_type'],
    );
  }

  /// Converts this [CourseFileModel] instance to a JSON map.
  ///
  /// The returned JSON map will contain the following keys: 'title', 'url', 'volume', and 'fileType'.
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'url': url,
      'volume': volume,
      'fileType': fileType,
    };
  }
}
