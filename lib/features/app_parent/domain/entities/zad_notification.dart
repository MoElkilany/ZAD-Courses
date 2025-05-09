import 'package:equatable/equatable.dart';

class ZadNotification extends Equatable {
  final int id;
  final String title;
  final String message;

  final String status;
  final DateTime createdAt;

  const ZadNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.status,
    required this.createdAt,
  });

  //copyWith to update the notification status
  ZadNotification copyWith({
    int? id,
    String? title,
    String? message,
    String? status,
    DateTime? createdAt,
  }) {
    return ZadNotification(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        message,
        status,
        createdAt,
      ];
}
