import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/config/app_progress_indicators.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/widgets/error/error_page.dart';
import '../../providers/dashboard_data.dart';
import 'dependents.dart';
import 'notices.dart';

class DashboardBodyParent extends ConsumerWidget {
  const DashboardBodyParent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardDataParent = ref.watch(getDashboardDataParentProvider);
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(getDashboardDataParentProvider);
      },
      color: kWhite,
      backgroundColor: kSecondary,
      child: dashboardDataParent.when(
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
                Notices(notices: dashboardData.notices),
                Dependents(dependents: dashboardData.dependents),
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
