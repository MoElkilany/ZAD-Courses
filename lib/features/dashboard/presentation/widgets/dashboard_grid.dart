import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/app_sized_box.dart';
import '../../../../core/types/app_types.dart';
import 'dashboard_card.dart';

class DashboardGrid extends ConsumerWidget {
  const DashboardGrid({
    super.key,
    required this.dashboardData,
  });

  final dynamic dashboardData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: DashboardCard(
                dashboardType: DashboardCardTypes.assignments,
                num: dashboardData.asgMarked,
                num2: dashboardData.asgPending,
              ),
            ),
            appSizeBoxW01,
            Expanded(
              child: DashboardCard(
                dashboardType: DashboardCardTypes.sessions,
                num: dashboardData.sessionsThisWeek,
                num2: dashboardData.sessionsThisMonth,
              ),
            ),
          ],
        ),
        appSizeBoxH01,
        Row(
          children: [
            Expanded(
              child: DashboardCard(
                dashboardType: DashboardCardTypes.support,
                num: dashboardData.ticketOpen,
                num2: dashboardData.ticketClosed,
              ),
            ),
            appSizeBoxW01,
            Expanded(
              child: DashboardCard(
                dashboardType: DashboardCardTypes.comments,
                num: dashboardData.commentsCount,
              ),
            ),
          ],
        ),
        appBoxH8,
      ],
    );
  }
}
