import 'package:flutter/material.dart';

import '../../../../core/widgets/appbar/zad_app_bar.dart';
import '../../../../core/widgets/drawer/zad_drawer.dart';
import '../../domain/entities/evaluation.dart';
import '../../domain/entities/evaluation_details.dart';
import '../widgets/evaluation_details/evaluation_details_body.dart';

class EvaluationDetailsPage extends StatelessWidget {
  const EvaluationDetailsPage({
    super.key,
    required this.data,
    required this.details,
  });
  final MonthlyEvaluation data;
  final EvaluationDetails details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ZADDrawer(),
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          ZADAppBar(),
          SliverFillRemaining(
            child: EvaluationDetailsBody(
              data: data,
              details: details,
            ),
          ),
        ],
      ),
    );
  }
}
