import 'package:riverpod/riverpod.dart';

import '../../domain/entities/course.dart';
import '../../domain/entities/student.dart';

final progressCourseFilterProvider = StateProvider<Course?>((ref) => null);

final progressStudentFilterProvider = StateProvider<Student?>((ref) => null);
