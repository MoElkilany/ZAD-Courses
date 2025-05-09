import 'package:equatable/equatable.dart';
import 'course_certificate.dart';
import 'course_chapter.dart';
import 'course_quiz.dart';

/// A class representing a course in the learning domain.
class Course extends Equatable {
  /// A list of chapters that make up the course.
  final List<CourseChapter> courseContents;

  /// A list of quizzes that are part of the course.
  final List<CourseQuiz> courseQuizzes;

  /// The certificate that is awarded upon completion of the course.
  final CourseCertificate certificate;

  /// Constructor for the Course class.
  const Course({
    required this.courseContents,
    required this.courseQuizzes,
    required this.certificate,
  });

  @override
  List<Object?> get props => [courseContents, courseQuizzes, certificate];
}
