import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/config/app_font_size.dart';
import '../../../../core/config/app_padding.dart';
import '../../../../core/config/app_shadow.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/config/app_border.dart';
import '../../../../core/config/app_size.dart';
import '../../../../core/types/app_types.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.dashboardType,
    required this.num,
    this.num2,
  });

  final DashboardCardTypes dashboardType;
  final int num;
  final int? num2;

  @override
  Widget build(BuildContext context) {
    final width = AppSize.width - 16;
    final height = AppSize.height;
    return Container(
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: appBordRadCir8,
        boxShadow: appShadowKDark02,
      ),
      width: width * 0.48,
      height: height * 0.08,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: appPaddingAll8,
              child: Container(
                decoration: BoxDecoration(
                  color: dashboardType == DashboardCardTypes.assignments || dashboardType == DashboardCardTypes.comments
                      ? kZadBlue.withOpacity(0.25)
                      : dashboardType == DashboardCardTypes.support
                          ? kYellow.withOpacity(0.25)
                          : kZadRed.withOpacity(0.25),
                  borderRadius: appBordRadCir8,
                ),
                child: Padding(
                  padding: appPaddingAll4,
                  child: Icon(
                    dashboardType == DashboardCardTypes.assignments
                        ? Icons.assignment_outlined
                        : dashboardType == DashboardCardTypes.sessions
                            ? Icons.videocam_outlined
                            : dashboardType == DashboardCardTypes.support
                                ? Icons.question_mark_rounded
                                : Icons.chat_bubble_outline_rounded,
                    size: height * 0.048,
                    color: dashboardType == DashboardCardTypes.assignments || dashboardType == DashboardCardTypes.comments
                        ? kZadBlue
                        : dashboardType == DashboardCardTypes.support
                            ? kYellow
                            : kZadRed,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: appPaddingR8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: AutoSizeText(
                      dashboardType == DashboardCardTypes.assignments
                          ? 'dashboard.assignments'.tr()
                          : dashboardType == DashboardCardTypes.support
                              ? 'dashboard.support'.tr()
                              : dashboardType == DashboardCardTypes.comments
                                  ? 'dashboard.comments'.tr()
                                  : 'dashboard.liveSessions'.tr(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: appFontSizeMedium,
                        color: kGray,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '$num',
                        style: TextStyle(
                          fontSize: appFontSizeCompact,
                          color: dashboardType == DashboardCardTypes.assignments ? kGreen : kBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (num2 != null)
                        Flexible(
                          child: AutoSizeText(
                            dashboardType == DashboardCardTypes.assignments
                                ? ' ${'dashboard.marked'.tr()} | '
                                : dashboardType == DashboardCardTypes.sessions
                                    ? ' ${'dashboard.week'.tr()} | '
                                    : ' ${'dashboard.open'.tr()} | ',
                            minFontSize: appMinSubTitleFontSize,
                            maxLines: 1,
                          ),
                        ),
                      if (num2 != null)
                        Text(
                          '${num2!}',
                          style: TextStyle(
                            fontSize: appFontSizeCompact,
                            fontWeight: FontWeight.bold,
                            color: dashboardType == DashboardCardTypes.assignments ? kRed : kBlue,
                          ),
                        ),
                      if (num2 != null)
                        Flexible(
                          child: AutoSizeText(
                            dashboardType == DashboardCardTypes.assignments
                                ? ' ${'dashboard.pending'.tr()}'
                                : dashboardType == DashboardCardTypes.sessions
                                    ? ' ${'dashboard.month'.tr()}'
                                    : ' ${'dashboard.closed'.tr()}',
                            maxLines: 1,
                            minFontSize: appMinSubTitleFontSize,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
