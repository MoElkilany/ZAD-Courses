import 'package:equatable/equatable.dart';

import 'bar_data.dart';

class DashboardDataStudent extends Equatable {
  final double availableBalance;
  final double withdrawableBalance;
  final int asgMarked;
  final int asgPending;
  final int sessionsThisWeek;
  final int sessionsThisMonth;
  final int ticketOpen;
  final int ticketClosed;
  final int commentsCount;
  final String currency;

  final List<List<String>> xAxis;
  final List<BarData> yAxis;

  const DashboardDataStudent({
    required this.availableBalance,
    required this.withdrawableBalance,
    required this.asgMarked,
    required this.asgPending,
    required this.sessionsThisWeek,
    required this.sessionsThisMonth,
    required this.ticketOpen,
    required this.ticketClosed,
    required this.commentsCount,
    required this.currency,
    required this.xAxis,
    required this.yAxis,
  });

  @override
  List<Object?> get props => [
        availableBalance,
        withdrawableBalance,
        asgMarked,
        asgPending,
        sessionsThisWeek,
        sessionsThisMonth,
        ticketOpen,
        ticketClosed,
        commentsCount,
        currency,
        xAxis,
        yAxis,
      ];
}
