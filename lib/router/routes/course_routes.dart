import '../../features/courses/presentation/pages/favourite_courses_page.dart';
import '../../features/courses/presentation/pages/learning_page.dart';
import '../../features/courses/presentation/pages/purchases_page.dart';
import '../../features/courses/presentation/pages/zoom_page.dart';

import '../router_utils.dart';

final courseRoutes = [
  buildRoute(AppPages.learning, const LearningScreen()),
  buildRoute(AppPages.purchases, const PurchasesScreen()),
  buildRoute(AppPages.favorites, const FavouriteCoursesScreen()),
  // buildRoute(AppPages.video, const VideoScreen()),
  buildRoute(AppPages.zoom, const ZoomScreen()),
];
