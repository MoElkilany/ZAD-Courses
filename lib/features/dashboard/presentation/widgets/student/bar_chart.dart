import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../../domain/entities/dashboard_data_student.dart';

class _BarChart extends StatelessWidget {
  const _BarChart({
    required this.dashboardData,
  });

  final DashboardDataStudent dashboardData;

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(
          show: true,
          drawHorizontalLine: true,
          drawVerticalLine: false,
          horizontalInterval: 10,
        ),
        alignment: BarChartAlignment.spaceEvenly,
        maxY: 120,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: true,
        handleBuiltInTouches: true,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (_) => Colors.blueGrey.shade200.withOpacity(0.7),
          tooltipPadding: const EdgeInsets.all(4),
          tooltipMargin: 4,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            final courseName = dashboardData.xAxis[groupIndex].map((e) {
              //if it ends with ' ' return it, otherwise add a space
              return e.endsWith(' ') ? e : '$e ';
            }).join(' ');
            //breakdown the rod stack items for each course

            return BarTooltipItem(
              '${rod.toY.roundToDouble()}%\n',
              const TextStyle(
                color: kBlue,
                fontWeight: FontWeight.bold,
              ),
              // children: dashboardData.yAxis.map((e) {
              //   return TextSpan(
              //     text: '${e.name} - ${e.values[groupIndex]}%\n',
              //     style: const TextStyle(
              //       fontWeight: FontWeight.bold,
              //     ),
              //   );
              // }).toList(),
              children: [
                TextSpan(
                  text: courseName,
                  style: const TextStyle(
                    color: kSecondary,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
      );

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (double value, TitleMeta meta) => const Text(''),
            reservedSize: 10,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 10,
            reservedSize: 50,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 10,
            reservedSize: 30,
            getTitlesWidget: (double value, TitleMeta meta) => const Text(''),
          ),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border.all(
          color: kSecondary,
          width: 1,
        ),
      );

  List<BarChartGroupData> get barGroups {
    return dashboardData.yAxis.first.values.asMap().entries.map((e) {
      dashboardData.yAxis.sort((a, b) {
        return double.parse(a.values[e.key]).compareTo(double.parse(b.values[e.key]));
      });

      final sum = dashboardData.yAxis.map((s) => double.parse(s.values[e.key])).reduce((a, b) => a + b);
      return BarChartGroupData(
        x: e.key,
        groupVertically: true,
        barRods: [
          BarChartRodData(
            toY: sum,
            width: 25,
            borderRadius: BorderRadius.zero,
            color: kBlue,
            // rodStackItems: dashboardData.yAxis
            //     .asMap()
            //     .entries
            //     .map((i) {
            //       final sumTillNow = dashboardData.yAxis
            //           .sublist(0, i.key)
            //           .map((s) => double.parse(s.values[e.key]))
            //           .reduce((a, b) => a + b);
            //       final Color barColor =
            //           ([...Colors.primaries]..shuffle()).first;
            //       return BarChartRodStackItem(
            //         0,
            //         double.parse(i.value.values[e.key]),
            //         barColor,
            //       );
            //     })
            //     .toList()
            //     .reversed
            //     .toList(),
          ),
        ],
      );
    }).toList();
  }
}

class BarChartStudent extends StatefulWidget {
  const BarChartStudent({
    super.key,
    required this.dashboardData,
  });

  final DashboardDataStudent dashboardData;

  @override
  State<StatefulWidget> createState() => BarChartStudentState();
}

class BarChartStudentState extends State<BarChartStudent> {
  @override
  Widget build(BuildContext context) {
    final dashboardData = widget.dashboardData;
    return AspectRatio(
      aspectRatio: 1.6,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16, left: 6),
                  child: _BarChart(
                    dashboardData: dashboardData,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.auto_graph_rounded,
                color: Colors.black.withOpacity(0.5),
              ),
              appSizeBoxW01,
              AutoSizeText(
                'dashboard.holdToInfo'.tr(),
                style: TextStyle(
                  fontSize: appFontSizeSmall,
                  fontStyle: FontStyle.italic,
                  color: kGray.withOpacity(0.7),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
