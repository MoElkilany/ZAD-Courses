import '../../features/support/presentation/pages/new_ticket_page.dart';
import '../../features/support/presentation/pages/ticket_history_page.dart';
import '../../features/support/presentation/pages/ticket_history_page_academic.dart';
import '../router_utils.dart';

final supportRoutes = [
  buildRoute(AppPages.support, const NewTicketPage()),
  buildRoute(AppPages.academicSupportHistory, const TicketHistoryPageAcademic()),
  buildRoute(AppPages.platformSupportHistory, const TicketHistoryPagePlatform()),
];
