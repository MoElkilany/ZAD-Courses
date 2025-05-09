import '../../domain/entities/notice.dart';

class NoticeModel extends Notice {
  const NoticeModel({
    required super.id,
    required super.title,
    super.course,
    required super.type,
    required super.sender,
    super.date,
    required super.message,
  });

  factory NoticeModel.fromJson(Map<String, dynamic> json) {
    return NoticeModel(
      id: json['id'],
      title: json['title'],
      course: json['course_name'] ?? '',
      type: json['type'],
      sender: json['sender'],
      date: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      message: json['message'],
    );
  }
}
