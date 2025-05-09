import 'package:equatable/equatable.dart';

import 'academic_ticket.dart';

class AcademicSupportHistory extends Equatable {
  final List<AcademicTicket> academicTickets;
  final int total;
  final int pending;
  final int closed;

  const AcademicSupportHistory({
    required this.academicTickets,
    required this.total,
    required this.pending,
    required this.closed,
  });

  @override
  List<Object?> get props => [
        academicTickets,
        total,
        pending,
        closed,
      ];
}
