import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../../domain/entities/dashboard_data_student.dart';
import 'bar_chart.dart';
import '../../../../../main.dart';

class DashboardGraphStudent extends ConsumerStatefulWidget {
  const DashboardGraphStudent({
    super.key,
    required this.dashboardData,
  });

  final DashboardDataStudent dashboardData;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardGraphStudentState();
}

class _DashboardGraphStudentState extends ConsumerState<DashboardGraphStudent> {
  @override
  Widget build(BuildContext context) {
    final dashboardData = widget.dashboardData;

    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AutoSizeText(
                'dashboard.learningStatistics'.tr(),
                style: const TextStyle(
                  fontSize: appFontSizeLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              AutoSizeText(
                '${DateTime.now().year}',
                style: const TextStyle(
                  fontSize: appFontSizeLarge,
                  fontWeight: FontWeight.bold,
                  color: kPrimary,
                ),
              ),
              appSizeBoxW02,
            ],
          ),
          appSizeBoxH01,
          SizedBox(
            height: isLandscape ? 500 : null,
            width: isLandscape ? double.infinity : null,
            child: BarChartStudent(
              dashboardData: dashboardData,
            ),
          ),
        ],
      ),
    );
  }
}
