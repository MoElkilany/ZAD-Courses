import '../../domain/entities/platform_ticket.dart';

class PlatformTicketModel extends PlatformTicket {
  const PlatformTicketModel({
    required super.id,
    required super.title,
    super.updatedAt,
    required super.department,
    required super.status,
  });

  factory PlatformTicketModel.fromJson(Map<String, dynamic> json) {
    return PlatformTicketModel(
      id: json['id'],
      title: json['title'],
      updatedAt: DateTime.parse(json['updated_at']),
      department: json['department'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'updated_at': updatedAt?.toIso8601String(),
      'department': department,
      'status': status,
    };
  }
}
