import '../../domain/entities/course_text.dart';

/// A data model class that represents a course text.
class CourseTextModel extends CourseText {
  /// Creates a [CourseTextModel] instance.
  ///
  /// [title], [url], [summary], and [image] are required parameters.
  const CourseTextModel({
    required super.title,
    required super.url,
    required super.summary,
    required super.image,
  });

  /// Creates a [CourseTextModel] instance from a JSON object.
  ///
  /// The JSON object must contain the following keys: 'title', 'url', 'volume', and 'fileType'.
  factory CourseTextModel.fromJson(Map<String, dynamic> json) {
    return CourseTextModel(
      title: json['translations'][0]['title'],
      url: json['translations'][0]['content'],
      summary: json['translations'][0]['summary'] ?? '',
      image: json['image'] ?? '',
    );
  }

  /// Converts this [CourseTextModel] instance to a JSON object.
  ///
  /// The returned JSON object will contain the following keys: 'title', 'url', 'volume', and 'fileType'.
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'url': url,
      'summary': summary,
      'image': image,
    };
  }
}
