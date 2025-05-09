import 'dart:developer';

import 'package:go_router/go_router.dart';

import 'providers/initialisation_listenable.dart';
import 'router_utils.dart';
import 'routes/assignment_routes.dart';
import 'routes/authentication_routes.dart';
import 'routes/course_routes.dart';
import 'routes/home_routes.dart';
import 'routes/misc_routes.dart';
import 'routes/monthly_evaluations.dart';
import 'routes/progress_routes.dart';
import 'routes/quizzes_routes.dart';
import 'routes/support_routes.dart';

class AppRouter {
  final InitializationListenable initializationListnable;

  AppRouter({
    required this.initializationListnable,
  });
  GoRouter get router => _goRouter;
  // late Authentication authentication;

  late final GoRouter _goRouter = GoRouter(
    refreshListenable: initializationListnable,

    initialLocation: AppPages.dashboard.toPath,
    routes: <GoRoute>[
      ...authRoutes,
      ...homeRoutes,
      ...monthlyEvaluationsRoutes,
      ...courseRoutes,
      ...assignmentRoutes,
      ...quizzesRoutes,
      ...supportRoutes,
      ...miscellaneousRoutes,
      ...progressRoutes,
    ],
    // errorBuilder: (context, state) =>
    //     ErrorScreen(error: state.error.toString()),
    redirect: (ctx, state) async {
      log('redirected : ${state.uri.toString()} with intialized state : ${initializationListnable.initialized} and authenticated state : ${initializationListnable.authenticated}');

      if (!initializationListnable.initialized && state.uri.toString() != AppPages.splash.toPath) {
        return AppPages.splash.toPath;
      }
      if (initializationListnable.initialized && !initializationListnable.authenticated && state.uri.toString() == AppPages.splash.toPath) {
        return AppPages.login.toPath;
      }

      if (initializationListnable.initialized && initializationListnable.authenticated && state.uri.toString() == AppPages.splashAuth.toPath) {
        // await Future.delayed(const Duration(seconds: 4));
        return AppPages.splash.toPath;
      }

      if (initializationListnable.initialized && initializationListnable.authenticated && state.uri.toString() == AppPages.splash.toPath) {
        return AppPages.dashboard.toPath;
      } else {
        // Else Don't do anything
        return null;
      }
    },
  );
}
