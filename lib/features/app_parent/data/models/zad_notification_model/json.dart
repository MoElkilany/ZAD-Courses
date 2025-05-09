import '../../../domain/entities/zad_notification.dart';

extension ZadNotificationJsonModel on ZadNotification {
  static ZadNotification fromJson(Map<String, dynamic> json) {
    return ZadNotification(
      id: json['id'],
      title: json['title'] ?? '',
      message: json['message'] ?? '',
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'status': status,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
