import 'course_assignment_model.dart';
import 'course_file_model.dart';
import 'course_office_hours_model.dart';
import 'course_session_model.dart';
import 'course_text_model.dart';
import '../../domain/entities/course_assignment.dart';
import '../../domain/entities/course_chapter.dart';
import '../../domain/entities/course_file.dart';
import '../../domain/entities/course_office_hours.dart';
import '../../domain/entities/course_session.dart';
import '../../domain/entities/course_text.dart';

/// A class that represents a course chapter model.
class CourseChapterModel extends CourseChapter {
  //super constructor
  const CourseChapterModel({
    required super.id,
    required super.title,
    required super.sessions,
    required super.officeHours,
    required super.files,
    required super.texts,
    required super.assignments,
  });

  /// A factory constructor that creates a course chapter model from a JSON map.
  factory CourseChapterModel.fromJson(Map<String, dynamic> json) {
    return CourseChapterModel(
      id: json['id'],
      title: json['translations'][0]['title'],
      sessions: (json['sessions'] as List).map((e) {
        final model = CourseSessionModel.fromJson(e);
        return CourseSession(title: model.title, url: model.url, status: model.status, date: model.date, id: model.id);
      }).toList(),
      officeHours: (json['sessions'] as List).map((e) {
        final model = CourseOfficeHoursModel.fromJson(e);
        return CourseOfficeHours(
          title: model.title,
          url: model.url,
          status: model.status,
          date: model.date,
          id: model.id,
        );
      }).toList(),
      files: (json['files'] as List).map((e) {
        final model = CourseFileModel.fromJson(e);
        return CourseFile(title: model.title, url: model.url, volume: model.volume, fileType: model.fileType);
      }).toList(),
      texts: (json['text_lessons'] as List).map((e) {
        final model = CourseTextModel.fromJson(e);
        return CourseText(title: model.title, url: model.url, summary: model.summary, image: model.image);
      }).toList(),
      assignments: (json['assignments'] as List).map((e) {
        final model = CourseAssignmentModel.fromJson(e);
        return CourseAssignment(
          id: model.id,
          status: model.status,
          title: model.title,
        );
      }).toList(),
    );
  }

  /// A method that converts a course chapter model to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'sessions': sessions
          .map((e) => CourseSessionModel(
                date: e.date,
                status: e.status,
                title: e.title,
                url: e.url,
                id: e.id,
              ).toJson())
          .toList(),
      'officeHours': officeHours
          .map((e) => CourseSessionModel(
                date: e.date,
                status: e.status,
                title: e.title,
                url: e.url,
                id: e.id,
              ).toJson())
          .toList(),
      'files': files
          .map((e) => CourseFileModel(
                fileType: e.fileType,
                title: e.title,
                url: e.url,
                volume: e.volume,
              ).toJson())
          .toList(),
      'texts': texts
          .map((e) => CourseTextModel(
                image: e.image,
                title: e.title,
                url: e.url,
                summary: e.summary,
              ).toJson())
          .toList(),
      'assignments': assignments
          .map((e) => CourseAssignmentModel(
                id: e.id,
                status: e.status,
                title: e.title,
              ).toJson())
          .toList(),
    };
  }
}
