import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/types/app_types.dart';
import '../../../domain/entities/dashboard_data_teacher.dart';
import '../../providers/dashboard_data.dart';
import 'line_chart.dart';
import '../../../../../main.dart';

class DashboardGraphTeacher extends ConsumerStatefulWidget {
  const DashboardGraphTeacher({super.key, required this.dashboardData});

  final DashboardDataTeacher dashboardData;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardGraphTeacherState();
}

class _DashboardGraphTeacherState extends ConsumerState<DashboardGraphTeacher> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final dashboardData = widget.dashboardData;

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AutoSizeText(
                'dashboard.monthlyRevenue'.tr(),
                style: const TextStyle(
                  fontSize: appFontSizeLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  setState(() {
                    ref.read(lineChartYearProvider.notifier).setLineChartyear(LineChartType.lastYear);
                  });
                },
                child: AutoSizeText(
                  '${DateTime.now().year - 1}',
                  style: const TextStyle(
                    fontSize: appFontSizeLarge,
                    fontWeight: FontWeight.bold,
                    color: kPink,
                  ),
                ),
              ),
              appSizeBoxW01,
              InkWell(
                onTap: () {
                  setState(() {
                    ref.read(lineChartYearProvider.notifier).setLineChartyear(LineChartType.thisYear);
                  });
                },
                child: AutoSizeText(
                  '${DateTime.now().year}',
                  style: const TextStyle(
                    fontSize: appFontSizeLarge,
                    fontWeight: FontWeight.bold,
                    color: kCyan,
                  ),
                ),
              ),
              appSizeBoxW02,
            ],
          ),
          appSizeBoxH01,
          SizedBox(
            height: isLandscape ? 500 : null,
            width: isLandscape ? double.infinity : null,
            child: LineChartTeacher(dashboardData: dashboardData),
          ),
        ],
      ),
    );
  }
}
