import 'course.dart';
import 'student.dart';

class Filters {
  final List<Student> students;
  final Map<int, List<Course>> courses;

  Filters({required this.students, required this.courses});
}
