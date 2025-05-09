import 'package:equatable/equatable.dart';
import 'platform_ticket.dart';

class PlatformSupportHistory extends Equatable {
  final List<PlatformTicket> platformTickets;
  final int total;
  final int pending;
  final int closed;

  const PlatformSupportHistory({
    required this.platformTickets,
    required this.total,
    required this.pending,
    required this.closed,
  });

  @override
  List<Object?> get props => [
        platformTickets,
        total,
        pending,
        closed,
      ];
}
