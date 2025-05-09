import 'dart:math';

import 'data/models/course_model.dart';
import 'data/models/purchased_course_model.dart';
import 'domain/entities/course_assignment.dart';
import 'domain/entities/course_certificate.dart';
import 'domain/entities/course_chapter.dart';
import 'domain/entities/course_file.dart';
import 'domain/entities/course_office_hours.dart';
import 'domain/entities/course_quiz.dart';
import 'domain/entities/course_session.dart';
import 'domain/entities/course_text.dart';

/// A class that contains mock data for testing Learning features, returns mock data as a [CourseModel].
class CoursesMocks {
  /// A [CourseModel] with a list of [CourseChapter]s.
  static final mCourse = CourseModel(
    certificate: const CourseCertificate(title: 'Certificate of Completion', url: 'https://flutter.dev', status: 'completed'),
    courseContents: [
      CourseChapter(
        id: 1,
        title: 'Chapter 1: Clean Architechture',
        sessions: [
          CourseSession(
            title: 'Domain and Data Layers',
            url: 'https://flutter.dev',
            status: 'completed',
            date: DateTime.parse('2021-01-01'),
            id: 2,
          ),
          CourseSession(
            title: 'Presentation Layer',
            url: 'https://flutter.dev',
            status: 'recorded',
            date: DateTime.parse('2022-02-02'),
            id: 1,
          ),
        ],
        officeHours: [
          CourseOfficeHours(
            title: 'Q&A Chapter 1',
            url: 'https://flutter.dev',
            status: 'completed',
            date: DateTime.parse('2022-02-02'),
            id: 2,
          )
        ],
        files: const [
          CourseFile(
            title: 'Chapter 1 Cheat sheet',
            url: 'https://flutter.dev',
            volume: '224',
            fileType: 'PDF',
          ),
          CourseFile(
            title: 'Chapter 1 Session Recordings',
            url: 'https://www.youtube.com/watch?v=-wAL46TFwQU',
            volume: '12121',
            fileType: 'video',
          ),
        ],
        texts: const [
          CourseText(
            title: 'Domain Layer',
            url: 'https://flutter.dev',
            summary: '123',
            image: 'text',
          ),
          CourseText(
            title: 'Data Layer',
            url: 'https://flutter.dev',
            summary: '112',
            image: 'text',
          ),
          CourseText(
            title: 'Presentation Layer',
            url: 'https://flutter.dev',
            summary: '223',
            image: 'text',
          ),
        ],
        assignments: const [
          CourseAssignment(
            id: 1,
            title: 'Assignment One: getting Started',
            status: 'completed',
          ),
          CourseAssignment(
            id: 2,
            title: 'Assignment Two: Create your first Test',
            status: 'pending',
          ),
        ],
      ),
      CourseChapter(
        id: 2,
        title: 'Chapter 2: Test Driven Development',
        sessions: [
          CourseSession(
            title: 'TDD: Main Concepts',
            url: 'https://flutter.dev',
            status: 'inProgress',
            date: DateTime.parse('2021-03-03'),
            id: 2,
          ),
          CourseSession(
            title: 'TDD: Hands on',
            url: 'https://flutter.dev',
            status: 'upcoming',
            date: DateTime.parse('2022-03-04'),
            id: 1,
          ),
        ],
        officeHours: const [],
        files: const [
          CourseFile(
            title: 'Chapter 1 Summary',
            url: 'https://flutter.dev',
            volume: '2777',
            fileType: 'PDF',
          ),
        ],
        texts: const [],
        assignments: const [],
      ),
    ],
    courseQuizzes: const [
      CourseQuiz(id: 1, title: 'Chapter 1 Quiz 1', status: 'completed'),
      CourseQuiz(id: 2, title: 'Chapter 1 Q2', status: 'completed'),
      CourseQuiz(id: 3, title: 'Chapter 1 - quiz 3', status: 'pending'),
      CourseQuiz(id: 4, title: 'Chapter 1: 4', status: 'missing'),
    ],
  );

  /// A [PurchasedCourseModel] mock.
  static final mpurchasedCourse = [
    PurchasedCourseModel(
      id: 1,
      courseContents: mCourse,
      classTitle: 'Flutter For More Advanced Developers: Clean Architechture',
      classYear: '2021/2022',
      classType: 'Live Class',
      durationPerSession: '2:00 Hrs',
      expireDate: '2022-02-02',
      instructorName: 'Youssef Zaka',
      isFavorite: true,
      purchaseDate: '2021-01-01',
      rating: 4.9,
      schoolType: 'High School',
      startDate: DateTime.parse('2021-01-01'),
      yearType: 'Third Year',
      imageUrl: 'https://picsum.photos/1920/1080?random=${Random().nextInt(999)}}',
    ),
    PurchasedCourseModel(
      id: 2,
      courseContents: mCourse,
      classTitle: 'Computer Vision: a look at some bits and bytes',
      classYear: '2021/2022',
      classType: 'Recorded Class',
      durationPerSession: '1:20 Hrs',
      expireDate: '2022-02-02',
      instructorName: 'Mayada Hadhoud',
      isFavorite: false,
      purchaseDate: '2021-01-01',
      rating: 3.9,
      schoolType: 'High School',
      startDate: DateTime.parse('2021-01-01'),
      yearType: 'Second Year',
      imageUrl: 'https://picsum.photos/1920/1080?random=${Random().nextInt(999)}}',
    ),
  ];
}
