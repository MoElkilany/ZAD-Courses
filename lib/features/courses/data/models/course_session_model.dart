import '../../domain/entities/course_session.dart';

/// A model class that represents a course session.
class CourseSessionModel extends CourseSession {
  /// Constructor for creating a [CourseSessionModel] instance.
  const CourseSessionModel({
    required super.title,
    required super.url,
    required super.status,
    required super.date,
    required super.id,
  });

  /// A factory constructor that creates a [CourseSessionModel] instance from a JSON map.
  factory CourseSessionModel.fromJson(Map<String, dynamic> json) {
    return CourseSessionModel(
      id: json['id'],
      title: json['translations'][0]['title'],
      url: json['link'],
      status: json['status'],
      //overwrite the date with the created_at date and start_time
      //handle the null time case
      date: DateTime.parse(json['created_at']).copyWith(
        hour: int.parse(json['start_time'].split(':')[0]),
        minute: int.parse(json['start_time'].split(':')[1]),
      ),
    );
  }

  /// A method that converts a [CourseSessionModel] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'url': url,
      'status': status,
      'date': date.toIso8601String(),
      'id': id,
    };
  }
}
