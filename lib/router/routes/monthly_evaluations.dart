import 'package:go_router/go_router.dart';

import '../../features/monthly_evaluation/presentation/pages/evaluation_details_page.dart';
import '../../features/monthly_evaluation/presentation/pages/evaluations_page.dart';
import '../router_utils.dart';

final monthlyEvaluationsRoutes = [
  buildRoute(AppPages.evaluations, const EvaluationsPage()),
  GoRoute(
    path: AppPages.evaluationDetails.toPath,
    name: AppPages.evaluationDetails.toName,
    pageBuilder: (context, state) {
      final dto = state.extra as Map;
      return buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: EvaluationDetailsPage(
          data: dto['data'],
          details: dto['details'],
        ),
      );
    },
  ),
];
