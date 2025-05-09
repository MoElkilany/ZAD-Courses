import 'package:equatable/equatable.dart';

class AcademicTicket extends Equatable {
  final int id;
  final String title;
  final String contactName;
  final String contactRole;
  final String contactEmail;
  final String contactPhoto;
  final DateTime? createdAt;
  final String assistantName;
  final String assistantEmail;
  final String assistantPhoto;
  final String role;
  final String status;
  final String courseName;

  const AcademicTicket({
    required this.id,
    required this.title,
    required this.contactName,
    required this.contactRole,
    required this.contactEmail,
    required this.contactPhoto,
    this.createdAt,
    required this.assistantName,
    required this.assistantEmail,
    required this.assistantPhoto,
    required this.role,
    required this.status,
    required this.courseName,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        contactName,
        contactRole,
        contactEmail,
        contactPhoto,
        createdAt,
        assistantName,
        assistantEmail,
        assistantPhoto,
        role,
        status,
        courseName,
      ];
}
