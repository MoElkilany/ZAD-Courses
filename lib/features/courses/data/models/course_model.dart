import 'course_certificate_model.dart';
import 'course_chapter_model.dart';
import 'course_quiz_model.dart';
import '../../domain/entities/course.dart';
import '../../domain/entities/course_certificate.dart';
import '../../domain/entities/course_chapter.dart';
import '../../domain/entities/course_quiz.dart';

/// A concrete implementation of the [Course] entity that extends the [Course] class.
class CourseModel extends Course {
  /// A const constructor that initializes a [CourseModel] object.
  const CourseModel({
    required super.courseContents,
    required super.courseQuizzes,
    required super.certificate,
  });

  //from json constructor
  /// A factory constructor that creates a [CourseModel] object from a JSON map.
  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
        //map json to list of course contents using CourseChapterModel.fromJson
        courseContents: (json['chapters'] as List).map((e) {
          final model = CourseChapterModel.fromJson(e);
          return CourseChapter(
            id: model.id,
            title: model.title,
            //map list of course sessions using CourseSessionModel.fromJson
            sessions: model.sessions,
            officeHours: model.officeHours,
            files: model.files,
            texts: model.texts,
            assignments: model.assignments,
          );
        }).toList(),
        //map json to list of course quizzes using CourseQuizModel.fromJson
        courseQuizzes: (json['quizzes'] as List).map((e) {
          final model = CourseQuizModel.fromJson(e);
          return CourseQuiz(
            id: model.id,
            title: model.title,
            status: model.status,
          );
        }).toList(),
        //map json to course certificate using CourseCertificateModel.fromJson
        certificate: CourseCertificate(
          url: json['certificate_url'] ?? '',
          title: json['certificate_title'] ?? '',
          status: json['certificate_status'] ?? '',
        ));
  }

  //to json method
  /// A method that converts a [CourseModel] object to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      //map list of course contents to json using CourseChapterModel.toJson
      'courseContents': courseContents
          .map((e) => CourseChapterModel(
                id: e.id,
                title: e.title,
                //map list of course sessions to json using CourseSessionModel.toJson
                sessions: e.sessions,
                officeHours: e.officeHours,
                files: e.files,
                texts: e.texts,
                assignments: e.assignments,
              ).toJson())
          .toList(),
      'courseQuizzes': courseQuizzes
          .map((e) => CourseQuizModel(
                id: e.id,
                title: e.title,
                status: e.status,
              ).toJson())
          .toList(),
      'certificate': CourseCertificateModel(
        url: certificate.url,
        title: certificate.title,
        status: certificate.status,
      ).toJson(),
    };
  }
}
