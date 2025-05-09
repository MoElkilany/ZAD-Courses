import '../../domain/entities/course.dart';

class CourseModel extends Course {
  CourseModel({
    required super.courseId,
    required super.name,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      courseId: json['id'],
      name: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': courseId,
      'title': name,
    };
  }
}
