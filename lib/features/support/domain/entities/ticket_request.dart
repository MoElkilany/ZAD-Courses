//ticket request entity

import 'package:zad_test/core/types/app_types.dart';

class TicketRequest {
  final String subject;
  final String message;
  final TicketType ticketType;
  final List<String> attachments;
  final int? department;
  final int? course;
  final int? role;

  TicketRequest({
    required this.subject,
    required this.message,
    required this.ticketType,
    required this.attachments,
    required this.department,
    required this.course,
    required this.role,
  });
}
