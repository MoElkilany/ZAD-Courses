import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_progress_indicators.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/widgets/error/error_page.dart';
import '../../../domain/entities/academic_support_history.dart';
import '../../providers/academicProviders/academic_manager.dart';
import '../../providers/support_history.dart';
import 'tickets_history_list_and_filter_academic.dart';
import 'tickets_list_academic.dart';
import '../tickets_stat_grid.dart';
import '../../../../../core/config/app_size.dart';

class TicketHistoryBodyAcademic extends ConsumerStatefulWidget {
  const TicketHistoryBodyAcademic({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TicketHistoryBodyState();
}

class _TicketHistoryBodyState extends ConsumerState<TicketHistoryBodyAcademic> {
  @override
  Widget build(BuildContext context) {
    AsyncValue<Either<Failure, AcademicSupportHistory>> supportHistory = ref.watch(getAcademicSupportHistoryProvider);

    final width = AppSize.width;
    final height = AppSize.height;

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(getAcademicSupportHistoryProvider);
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
                    ref.invalidate(getAcademicSupportHistoryProvider);
                  },
                ),
              ),
            );
          }

          final academicManager = ref.watch(academicManagerProvider.notifier);
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
                  supportType: 'academic',
                ),
                const TicketsHistoryListAndFilterAcademic(),
                academicManager.filteredTickets.isEmpty
                    ? Center(
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: ErrorPage(
                            errorMessage: 'support.noTickets'.tr(),
                            height: height * 0.32,
                            showRefresh: true,
                            onDesktopRefresh: () {
                              ref.invalidate(getAcademicSupportHistoryProvider);
                            },
                          ),
                        ),
                      )
                    : Flexible(
                        fit: FlexFit.loose,
                        child: TicketsListAcademic(
                          height: height,
                          width: width,
                          ticketList: academicManager.filteredTickets,
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
