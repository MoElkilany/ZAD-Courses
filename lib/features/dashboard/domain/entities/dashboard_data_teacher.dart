import 'package:equatable/equatable.dart';

class DashboardDataTeacher extends Equatable {
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

  final List<String> xAxis;
  final List<double> yAxisThisYear;
  final List<double> yAxisLastYear;

  const DashboardDataTeacher({
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
    required this.yAxisThisYear,
    required this.yAxisLastYear,
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
        yAxisThisYear,
        yAxisLastYear,
      ];
}
