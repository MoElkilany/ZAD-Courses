import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppPages {
  // Home Routes
  home,
  dashboard,
  financial,
  noticeboard,
  newNotice,
  assignments,
  courseSubmissions,
  assignmentDetailsStudent,
  assignmentSubmissionDetails,
  assignmentsDetailsTeacher,
  quizResults,
  quizNotSubmitted,
  quizzesDetailsStudent,
  quizzesDetailsTeacher,
  evaluations,
  evaluationDetails,
  progress,
  //course Routes
  learning,
  purchases,
  favorites,
  // video,
  zoom,
  // Authentication Routes
  login,
  register,
  verification,
  // misc
  splash,
  splashAuth,
  profile,
  support,
  academicSupportHistory,
  platformSupportHistory,
  error,
}

extension AppPageExtension on AppPages {
  String get toPath {
    switch (this) {
      case AppPages.home:
        return "/";
      case AppPages.dashboard:
        return "/dashboard";
      case AppPages.financial:
        return "/financial";
      case AppPages.noticeboard:
        return "/noticeboard";
      case AppPages.newNotice:
        return "/newNotice";
      case AppPages.assignments:
        return "/assignments";
      case AppPages.courseSubmissions:
        return "/courseSubmissions";
      case AppPages.assignmentDetailsStudent:
        return "/assignmentDetailsStudent";
      case AppPages.assignmentSubmissionDetails:
        return "/assignmentSubmissionDetails";
      case AppPages.assignmentsDetailsTeacher:
        return "/assignmentsDetailsTeacher";
      case AppPages.quizResults:
        return "/quizzes";
      case AppPages.quizNotSubmitted:
        return "/quizNotSubmitted";
      case AppPages.quizzesDetailsStudent:
        return "/quizzesDetailsStudent";
      case AppPages.quizzesDetailsTeacher:
        return "/quizzesDetailsTeacher";
      case AppPages.evaluationDetails:
        return "/evaluationDetails";
      case AppPages.evaluations:
        return "/evaluations";
      case AppPages.learning:
        return "/learning";
      case AppPages.purchases:
        return "/purchases";
      case AppPages.favorites:
        return "/favorites";
      case AppPages.progress:
        return "/progress";
      // case AppPages.video:
      //   return "/video";
      case AppPages.zoom:
        return "/zoom";
      case AppPages.splash:
        return "/splash";
      case AppPages.splashAuth:
        return "/splashAuth";
      case AppPages.profile:
        return "/profile";
      case AppPages.login:
        return "/login";
      case AppPages.register:
        return "/register";
      case AppPages.verification:
        return "/verification";
      case AppPages.support:
        return "/support";
      case AppPages.academicSupportHistory:
        return "/academicSupportHistory";
      case AppPages.platformSupportHistory:
        return "/platformSupportHistory";
      case AppPages.error:
        return "/error";
      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case AppPages.home:
        return "HOME";
      case AppPages.dashboard:
        return "DASHBOARD";
      case AppPages.financial:
        return "FINANCIAL";
      case AppPages.noticeboard:
        return "NOTICEBOARD";
      case AppPages.newNotice:
        return "NEW_NOTICE";
      case AppPages.assignments:
        return "ASSIGNMENTS";
      case AppPages.courseSubmissions:
        return "COURSE_SUBMISSIONS";
      case AppPages.assignmentDetailsStudent:
        return "ASSIGNMENT_DETAILS_STUDENT";
      case AppPages.assignmentSubmissionDetails:
        return "ASSIGNMENT_SUBMISSION_DETAILS";
      case AppPages.assignmentsDetailsTeacher:
        return "ASSIGNMENTS_DETAILS_TEACHER";
      case AppPages.quizResults:
        return "QUIZZES";
      case AppPages.quizNotSubmitted:
        return "QUIZ_NOT_SUBMITTED";
      case AppPages.evaluationDetails:
        return "EVALUATIONS_DETAILS";
      case AppPages.evaluations:
        return "EVALUATIONS";
      case AppPages.quizzesDetailsStudent:
        return "QUIZZES_DETAILS_STUDENT";
      case AppPages.quizzesDetailsTeacher:
        return "QUIZZES_DETAILS_TEACHER";
      case AppPages.learning:
        return "LEARNING";
      case AppPages.purchases:
        return "PURCHASES";
      case AppPages.favorites:
        return "FAVORITES";
      case AppPages.progress:
        return "PROGRESS";
      // case AppPages.video:
      //   return "VIDEO";
      case AppPages.zoom:
        return "ZOOM";
      case AppPages.login:
        return "LOGIN";
      case AppPages.register:
        return "REGISTER";
      case AppPages.verification:
        return "VERIFICATION";
      case AppPages.splash:
        return "SPLASH";
      case AppPages.splashAuth:
        return "SPLASH_AUTH";
      case AppPages.profile:
        return "PROFILE";
      case AppPages.support:
        return "SUPPORT";
      case AppPages.academicSupportHistory:
        return "ACADEMIC_SUPPORT_HISTORY";
      case AppPages.platformSupportHistory:
        return "PLATFORM_SUPPORT_HISTORY";
      case AppPages.error:
        return "ERROR";

      default:
        return "HOME";
    }
  }

  String get toTitle {
    switch (this) {
      case AppPages.home:
        return "Featured Courses";
      case AppPages.dashboard:
        return "Dashboard";
      case AppPages.financial:
        return "Financial";
      case AppPages.noticeboard:
        return "Noticeboard";
      case AppPages.newNotice:
        return "New Notice";
      case AppPages.login:
        return "Login";
      case AppPages.register:
        return "Register";
      case AppPages.verification:
        return "Verification";
      case AppPages.splash:
        return "ZAD";
      case AppPages.error:
        return "Something went wrong";
      case AppPages.assignments:
        return "Assignments";
      case AppPages.courseSubmissions:
        return "Course Submissions";
      case AppPages.assignmentDetailsStudent:
        return "Assignment Details";
      case AppPages.assignmentSubmissionDetails:
        return "Assignment Submission Details";
      case AppPages.assignmentsDetailsTeacher:
        return "Assignment Details";
      case AppPages.quizResults:
        return "Quizzes";
      case AppPages.quizNotSubmitted:
        return "Quizzes";
      case AppPages.quizzesDetailsStudent:
        return "Quiz Details";
      case AppPages.quizzesDetailsTeacher:
        return "Quiz Details";
      case AppPages.learning:
        return "Learning Page";
      case AppPages.purchases:
        return "Purchases";
      case AppPages.favorites:
        return "Favorites";
      case AppPages.progress:
        return "Progress";
      // case AppPages.video:
      //   return "Video";
      case AppPages.zoom:
        return "Meeting";
      case AppPages.profile:
        return "Profile";
      case AppPages.support:
        return "Support";
      case AppPages.academicSupportHistory:
        return "Academic Support Tickets";
      case AppPages.platformSupportHistory:
        return "Platform Support Tickets";

      default:
        return "ZAD";
    }
  }
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
  );
}

buildRoute(AppPages route, Widget page) => GoRoute(
      path: route.toPath,
      name: route.toName,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: page,
      ),
    );
