import '../../../Noticeboard/domain/entities/notice.dart';
import 'dependent.dart';

class DashboardDataParent {
  final List<Notice> notices;
  final List<Dependent> dependents;

  const DashboardDataParent({
    required this.notices,
    required this.dependents,
  });
}
