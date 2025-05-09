import '../../domain/entities/dashboard_data_teacher.dart';

class DashboardDataTeacherModel extends DashboardDataTeacher {
  const DashboardDataTeacherModel({
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
    required super.yAxisThisYear,
    required super.yAxisLastYear,
  });

  factory DashboardDataTeacherModel.fromJson(Map<String, dynamic> json) => DashboardDataTeacherModel(
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
        xAxis: (json['monthlyChart']['months'] as List).map((e) => e.toString()).toList(),
        yAxisThisYear: (json['monthlyChart']['thisYear'] as List<dynamic>).map((e) {
          if (e is int) {
            return e.toDouble();
          }
          return e as double;
        }).toList(),
        yAxisLastYear: (json['monthlyChart']['lastYear'] as List<dynamic>).map((e) {
          if (e is int) {
            return e.toDouble();
          }
          return e as double;
        }).toList(),
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
        'monthlyChart': {
          'months': xAxis,
          'thisYear': yAxisThisYear,
          'lastYear': yAxisLastYear,
        },
      };
}
