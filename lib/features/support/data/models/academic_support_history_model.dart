import 'academic_ticket_model.dart';
import '../../domain/entities/academic_support_history.dart';
import '../../domain/entities/academic_ticket.dart';

class AcademicSupportHistoryModel extends AcademicSupportHistory {
  const AcademicSupportHistoryModel({
    required super.academicTickets,
    required super.total,
    required super.pending,
    required super.closed,
  });

  factory AcademicSupportHistoryModel.fromJson(Map<String, dynamic> json) {
    return AcademicSupportHistoryModel(
      //map json['data'] to length of the list
      total: json['data'].map((e) => e).toList().length,
      //map json['data'] to length of the list where status == open
      pending: json['data'].map((e) => e).toList().where((element) => element['status'] == 'open').length,
      //map json['data'] to length of the list where status != open
      closed: json['data'].map((e) => e).toList().where((element) => element['status'] != 'open').length,
      academicTickets: List<AcademicTicket>.from(
        json['data'].map(
          (x) {
            final model = AcademicTicketModel.fromJson(x);
            return AcademicTicket(
              id: model.id,
              title: model.title,
              assistantEmail: model.assistantEmail,
              assistantName: model.assistantName,
              assistantPhoto: model.assistantPhoto,
              contactEmail: model.contactEmail,
              contactName: model.contactName,
              contactPhoto: model.contactPhoto,
              contactRole: model.contactRole,
              createdAt: model.createdAt,
              role: model.role,
              status: model.status,
              courseName: model.courseName,
            );
          },
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'pending': pending,
      'closed': closed,
      'academic_tickets': academicTickets.map(
        (x) {
          final model = AcademicTicketModel(
            id: x.id,
            title: x.title,
            assistantEmail: x.assistantEmail,
            assistantName: x.assistantName,
            assistantPhoto: x.assistantPhoto,
            contactEmail: x.contactEmail,
            contactName: x.contactName,
            contactPhoto: x.contactPhoto,
            contactRole: x.contactRole,
            createdAt: x.createdAt,
            role: x.role,
            status: x.status,
            courseName: x.courseName,
          );
          return model.toJson();
        },
      ),
    };
  }
}
