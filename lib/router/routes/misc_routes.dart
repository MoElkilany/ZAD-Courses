import '../../features/Noticeboard/presentation/pages/new_notice_page.dart';
import '../../features/Financial/presentation/pages/financial_page.dart';
import '../../features/Noticeboard/presentation/pages/noticeboard_page.dart';
import '../../features/app_parent/presentation/pages/profile_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../router_utils.dart';

final miscellaneousRoutes = [
  buildRoute(AppPages.splash, const SplashPage()),
  buildRoute(AppPages.splashAuth, const SplashPage()),
  buildRoute(AppPages.profile, const ProfilePage()),
  buildRoute(AppPages.dashboard, const DashboardPage()),
  buildRoute(AppPages.financial, const FinancialPage()),
  buildRoute(AppPages.noticeboard, const NoticeboardPage()),
  buildRoute(AppPages.newNotice, const NewNoticePage()),
];
