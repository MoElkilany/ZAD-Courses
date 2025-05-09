import '../../domain/entities/academic_ticket.dart';

class AcademicTicketModel extends AcademicTicket {
  const AcademicTicketModel({
    required super.id,
    required super.title,
    required super.contactName,
    required super.contactRole,
    required super.contactEmail,
    required super.contactPhoto,
    super.createdAt,
    required super.assistantName,
    required super.assistantEmail,
    required super.assistantPhoto,
    required super.role,
    required super.status,
    required super.courseName,
  });

  factory AcademicTicketModel.fromJson(Map<String, dynamic> json) {
    return AcademicTicketModel(
      id: json['id'],
      title: json['title'],
      contactName: json['course']['teacher']['full_name'] ?? '',
      contactRole: json['course']['teacher']['role_name'] ?? '',
      contactEmail: json['contact_email'] ?? '',
      contactPhoto: json['course']['teacher']['avatar'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      assistantName: json['assistant_name'] ?? '',
      assistantEmail: json['assistant_email'] ?? '',
      assistantPhoto: json['assistant_photo'] ?? '',
      role: json['role'] ?? '',
      status: json['status'] ?? '',
      courseName: json['course']['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'contact_name': contactName,
      'contact_role': contactRole,
      'contact_email': contactEmail,
      'contact_photo': contactPhoto,
      'created_at': createdAt?.toIso8601String(),
      'assistant_name': assistantName,
      'assistant_email': assistantEmail,
      'assistant_photo': assistantPhoto,
      'role': role,
      'status': status,
      'course_name': courseName,
    };
  }
}
