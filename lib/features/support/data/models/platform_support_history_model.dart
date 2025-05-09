import 'platform_ticket_model.dart';
import '../../domain/entities/platform_support_history.dart';
import '../../domain/entities/platform_ticket.dart';

class PlatformSupportHistoryModel extends PlatformSupportHistory {
  const PlatformSupportHistoryModel({
    required super.platformTickets,
    required super.total,
    required super.pending,
    required super.closed,
  });

  factory PlatformSupportHistoryModel.fromJson(Map<String, dynamic> json) {
    return PlatformSupportHistoryModel(
      //map json['data'] to length of the list
      total: json['data'].map((e) => e).toList().length,
      //map json['data'] to length of the list where status == open
      pending: json['data'].map((e) => e).toList().where((element) => element['status'] == 'open').length,
      //map json['data'] to length of the list where status != open
      closed: json['data'].map((e) => e).toList().where((element) => element['status'] != 'open').length,
      platformTickets: List<PlatformTicket>.from(
        json['data'].map(
          (x) {
            final model = PlatformTicketModel.fromJson(x);
            return PlatformTicket(
              id: model.id,
              title: model.title,
              updatedAt: model.updatedAt,
              department: model.department,
              status: model.status,
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
      'platform_tickets': platformTickets.map(
        (x) {
          final model = PlatformTicketModel(
            id: x.id,
            title: x.title,
            updatedAt: x.updatedAt,
            department: x.department,
            status: x.status,
          );
          return model.toJson();
        },
      ),
    };
  }
}
