import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/types/app_types.dart';
import '../../../domain/entities/dashboard_data_teacher.dart';
import '../../providers/dashboard_data.dart';

class _LineChart extends StatelessWidget {
  const _LineChart({
    required this.isShowingMainData,
    required this.xAxis,
    required this.yAxis,
    required this.yAxisthis,
    required this.yAxisLast,
  });

  final bool isShowingMainData;
  final List<String> xAxis;
  final List<double> yAxis;
  final List<double> yAxisthis;
  final List<double> yAxisLast;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      isShowingMainData ? sampleData1 : sampleData2,
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
      );

  LineChartData get sampleData2 => LineChartData(
        lineTouchData: lineTouchData2,
        gridData: gridData,
        titlesData: titlesData2,
        borderData: borderData,
        lineBarsData: lineBarsData2,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (_) => Colors.blueGrey.withOpacity(0.3),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1,
      ];

  LineTouchData get lineTouchData2 => LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (_) => Colors.blueGrey.withOpacity(0.3),
        ),
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData2 => [
        lineChartBarData2_1,
        lineChartBarData2_2,
      ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: appFontSizeCompact,
    );
    String text = '';
    if (value % 1000 == 0) text = (value.toInt()).toString();

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1000,
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: appFontSizeSmall,
    );
    value = value - 1;
    Widget text;
    if (value >= 0 && value < xAxis.length) {
      text = Text(xAxis[value.toInt()], style: style);
    } else {
      text = const SizedBox();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: kSecondary, width: 2),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  List<FlSpot> get spots1 {
    final List<FlSpot> spots = [];
    for (int i = 0; i < yAxis.length; i++) {
      spots.add(FlSpot(i.toDouble() + 1, yAxis[i]));
    }
    return spots;
  }

  List<FlSpot> get spots2_1 {
    final List<FlSpot> spots = [];
    for (int i = 0; i < yAxisthis.length; i++) {
      spots.add(FlSpot(i.toDouble() + 1, yAxisthis[i]));
    }
    return spots;
  }

  List<FlSpot> get spots2_2 {
    final List<FlSpot> spots = [];
    for (int i = 0; i < yAxisLast.length; i++) {
      spots.add(FlSpot(i.toDouble() + 1, yAxisLast[i]));
    }
    return spots;
  }

  LineChartBarData get lineChartBarData1 => LineChartBarData(
        isCurved: true,
        color: yAxis == yAxisthis ? kPrimary : kPink,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: spots1,
      );

  LineChartBarData get lineChartBarData2_1 => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        color: kPrimary.withOpacity(0.5),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(
          show: true,
          color: kPrimary.withOpacity(0.3),
        ),
        spots: spots2_1,
      );

  LineChartBarData get lineChartBarData2_2 => LineChartBarData(
        isCurved: true,
        color: kPink.withOpacity(0.5),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(
          show: true,
          color: kPink.withOpacity(0.3),
        ),
        spots: spots2_2,
      );
}

class LineChartTeacher extends ConsumerStatefulWidget {
  const LineChartTeacher({super.key, required this.dashboardData});
  final DashboardDataTeacher dashboardData;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LineChartTeacherState();
}

class _LineChartTeacherState extends ConsumerState<LineChartTeacher> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    final year = ref.watch(lineChartYearProvider);
    return AspectRatio(
      aspectRatio: 1.6,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 37,
              ),
              const SizedBox(
                height: 37,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16, left: 6),
                  child: _LineChart(
                    isShowingMainData: isShowingMainData,
                    xAxis: widget.dashboardData.xAxis,
                    yAxis: year == LineChartType.thisYear ? widget.dashboardData.yAxisThisYear : widget.dashboardData.yAxisLastYear,
                    yAxisthis: widget.dashboardData.yAxisThisYear,
                    yAxisLast: widget.dashboardData.yAxisLastYear,
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
              IconButton(
                icon: Icon(
                  Icons.auto_graph_rounded,
                  color: Colors.black.withOpacity(isShowingMainData ? 1.0 : 0.5),
                ),
                onPressed: () {
                  setState(() {
                    isShowingMainData = !isShowingMainData;
                  });
                },
              ),
              AutoSizeText(
                'dashboard.tapToInfo'.tr(),
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
