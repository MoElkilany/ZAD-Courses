import '../../domain/entities/course.dart';

class CourseModel extends Course {
  CourseModel({required super.name, required super.id});

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      name: json['titleCourseGroup'],
      id: json['id'],
    );
  }
}
