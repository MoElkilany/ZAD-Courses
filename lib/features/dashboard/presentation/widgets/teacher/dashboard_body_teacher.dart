import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/config/app_progress_indicators.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/widgets/error/error_page.dart';
import '../../providers/dashboard_data.dart';
import '../dashboard_grid.dart';
import '../dashboard_header.dart';
import 'dashboard_graph_teacher.dart';

class DashboardBodyTeacher extends ConsumerWidget {
  const DashboardBodyTeacher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardDataTeacher = ref.watch(getDashboardDataTeacherProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(getDashboardDataTeacherProvider);
      },
      color: kWhite,
      backgroundColor: kSecondary,
      child: dashboardDataTeacher.when(
        skipLoadingOnRefresh: false,
        data: (data) {
          final dashboardData = data.fold((l) => null, (r) => r);
          if (dashboardData == null) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ErrorPage(
                errorMessage: 'errors.serverError'.tr(),
              ),
            );
          }

          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                DashboardHeader(
                  availableBalance: dashboardData.availableBalance,
                  withdrawableBalance: dashboardData.withdrawableBalance,
                  currency: dashboardData.currency,
                ),
                DashboardGraphTeacher(
                  dashboardData: dashboardData,
                ),
                DashboardGrid(
                  dashboardData: dashboardData,
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return Text(error.toString());
        },
        loading: () {
          return const Center(
            child: appDefaultCircIndicator,
          );
        },
      ),
    );
  }
}
