import '../../domain/entities/student.dart';

class StudentModel extends Student {
  StudentModel({
    required super.studentId,
    required super.name,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      studentId: json['id'],
      name: json['full_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': studentId,
      'full_name': name,
    };
  }
}
