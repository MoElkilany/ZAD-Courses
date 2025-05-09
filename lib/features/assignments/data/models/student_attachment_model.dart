import '../../domain/entities/student_attachment.dart';

class StudentAttachmentModel extends StudentAttachment {
  const StudentAttachmentModel({
    required super.url,
    required super.name,
  });

  factory StudentAttachmentModel.fromJson(Map<String, dynamic> json) {
    return StudentAttachmentModel(
      url: json['url'],
      name: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'title': name,
    };
  }
}
