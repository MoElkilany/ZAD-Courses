import '../../domain/entities/filters.dart';
import '../../domain/entities/student.dart';
import 'course_model.dart';
import 'student_model.dart';

class FiltersModel extends Filters {
  FiltersModel({required super.students, required super.courses});

  factory FiltersModel.fromJson(Map<String, dynamic> json) {
    return FiltersModel(
      students: (json['children'] as List)
          .cast<Map<String, dynamic>>()
          .map<Student>(
            StudentModel.fromJson,
          )
          .toList(),
      courses: (json['childrenData'] as Map<String, dynamic>).map(
        (k, v) => MapEntry<int, List<CourseModel>>(
          int.parse(k),
          (v as List)
              .cast<Map<String, dynamic>>()
              .map(
                CourseModel.fromJson,
              )
              .toList(),
        ),
      ),
    );
  }
}
