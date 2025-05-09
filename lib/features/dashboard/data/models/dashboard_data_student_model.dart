import 'bar_data_model.dart';
import '../../domain/entities/dashboard_data_student.dart';

class DashboardDataStudentModel extends DashboardDataStudent {
  const DashboardDataStudentModel({
    required super.availableBalance,
    required super.withdrawableBalance,
    required super.asgMarked,
    required super.asgPending,
    required super.sessionsThisWeek,
    required super.sessionsThisMonth,
    required super.ticketOpen,
    required super.ticketClosed,
    required super.commentsCount,
    required super.currency,
    required super.xAxis,
    required super.yAxis,
  });
  factory DashboardDataStudentModel.fromJson(Map<String, dynamic> json) => DashboardDataStudentModel(
        availableBalance: json['accountBalance']['availableBalance'].toDouble(),
        withdrawableBalance: json['accountBalance']['withdrawbleBalance'].toDouble(),
        asgMarked: json['assignmentMarked'],
        asgPending: json['assignmentPending'],
        sessionsThisWeek: json['liveSessionThisWeek'],
        sessionsThisMonth: json['liveSessionThisMonth'],
        ticketOpen: json['supportTicketsOpen'],
        ticketClosed: json['supportTicketsClose'],
        commentsCount: json['commentsCount'],
        currency: json['currency'],
        xAxis: (json['learningStatistics']['xaxis'] as List).map((e) => (e as List).map((e) => e.toString()).toList()).toList(),
        yAxis: (json['learningStatistics']['yaxis'] as List).map((e) => BarDataModel.fromJson(e as Map<String, dynamic>)).toList(),
      );

  Map<String, dynamic> toJson() => {
        'accountBalance': {
          'availableBalance': availableBalance,
          'withdrawbleBalance': withdrawableBalance,
        },
        'assignmentMarked': asgMarked,
        'assignmentPending': asgPending,
        'liveSessionThisWeek': sessionsThisWeek,
        'liveSessionThisMonth': sessionsThisMonth,
        'supportTicketsOpen': ticketOpen,
        'supportTicketsClose': ticketClosed,
        'commentsCount': commentsCount,
        'learningStatistics': {
          'xAxis': xAxis,
          'yAxis': yAxis.map((e) {
            return BarDataModel(name: e.name, values: e.values).toJson();
          }).toList(),
        },
      };
}
