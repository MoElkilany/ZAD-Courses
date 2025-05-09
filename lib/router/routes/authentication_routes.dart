import '../../features/authentication/presentation/pages/register_page.dart';

import '../../features/authentication/presentation/pages/login_page.dart';
import '../router_utils.dart';

final authRoutes = [
  buildRoute(AppPages.login, const LoginPage()),
  buildRoute(AppPages.register, const RegisterPage()),
];
