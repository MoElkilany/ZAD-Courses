import 'package:flutter/material.dart';

import '../../../../../core/config/colors.dart';
import '../../../domain/entities/dependent.dart';
import 'bar_chart.dart';

class Dependents extends StatelessWidget {
  const Dependents({
    super.key,
    required this.dependents,
  });

  final List<Dependent> dependents;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Dependents',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 8),
        ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 8),
          children: dependents.indexed
              .map(
                (d) => ExpansionTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  childrenPadding: EdgeInsets.symmetric(horizontal: 12),
                  title: Text(d.$2.studentName),
                  textColor: kDark,
                  initiallyExpanded: d.$1 == 0,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  collapsedBackgroundColor: Colors.grey.withOpacity(0.1),
                  collapsedTextColor: kDark,
                  iconColor: kDark,
                  collapsedIconColor: kDark,
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${d.$2.courses} courses'),
                      Text('${d.$2.assignments} assignments'),
                      Text('${d.$2.quizzes} quizzes'),
                    ],
                  ),
                  children: [
                    BarChartParent(dashboardData: d.$2),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
