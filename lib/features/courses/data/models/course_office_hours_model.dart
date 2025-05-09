import '../../domain/entities/course_session.dart';

/// A model class representing a course office hours session.
class CourseOfficeHoursModel extends CourseSession {
  /// Creates a [CourseOfficeHoursModel] instance.
  ///
  /// [title], [url], [status], and [date] are required parameters.
  const CourseOfficeHoursModel({
    required super.title,
    required super.url,
    required super.status,
    required super.date,
    required super.id,
  });

  /// Creates a [CourseOfficeHoursModel] instance from a JSON object.
  ///
  /// The JSON object must have the following keys: 'title', 'url', 'status', and 'date'.
  factory CourseOfficeHoursModel.fromJson(Map<String, dynamic> json) {
    return CourseOfficeHoursModel(
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

  /// Converts this [CourseOfficeHoursModel] instance to a JSON object.
  ///
  /// The returned JSON object has the following keys: 'title', 'url', 'status', and 'date'.
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
