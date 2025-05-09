import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/config/app_progress_indicators.dart';
import '../../../../../core/config/app_size.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/widgets/error/error_page.dart';
import '../../../domain/entities/platform_support_history.dart';
import '../../providers/platformProviders/platform_manager.dart';
import '../../providers/support_history.dart';
import '../tickets_stat_grid.dart';
import 'tickets_history_list_and_filter_platform.dart';
import 'tickets_list_platform.dart';

class TicketHistoryBodyPlatform extends ConsumerStatefulWidget {
  const TicketHistoryBodyPlatform({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TicketHistoryBodyState();
}

class _TicketHistoryBodyState extends ConsumerState<TicketHistoryBodyPlatform> {
  @override
  Widget build(BuildContext context) {
    AsyncValue<Either<Failure, PlatformSupportHistory>> supportHistory = ref.watch(getPlatformSupportHistoryProvider);
    final width = AppSize.width;
    final height = AppSize.height;

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(getPlatformSupportHistoryProvider);
      },
      color: kWhite,
      backgroundColor: kSecondary,
      child: supportHistory.when(
        skipLoadingOnRefresh: false,
        data: (data) {
          final academicSupportHistory = data.fold((l) => null, (r) => r);
          if (academicSupportHistory == null) {
            return Center(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ErrorPage(
                  errorMessage: 'errors.serverError'.tr(),
                  showRefresh: true,
                  onDesktopRefresh: () {
                    ref.invalidate(getPlatformSupportHistoryProvider);
                  },
                ),
              ),
            );
          }
          final platformManager = ref.watch(platformManagerProvider.notifier);
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TicketsStatGrid(
                  totalNum: academicSupportHistory.total,
                  closedNum: academicSupportHistory.closed,
                  pendingNum: academicSupportHistory.pending,
                  supportType: 'platform',
                ),
                const TicketsHistoryListAndFilterPlatform(),
                platformManager.filteredTickets.isEmpty
                    ? Center(
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: ErrorPage(
                            errorMessage: 'support.noTickets'.tr(),
                            height: height * 0.32,
                            showRefresh: true,
                            onDesktopRefresh: () {
                              ref.invalidate(getPlatformSupportHistoryProvider);
                            },
                          ),
                        ),
                      )
                    : Flexible(
                        fit: FlexFit.loose,
                        child: TicketsListPlatform(
                          height: height,
                          width: width,
                          ticketList: platformManager.filteredTickets,
                        ),
                      ),
              ],
            ),
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(child: appDefaultCircIndicator),
      ),
    );
  }
}
