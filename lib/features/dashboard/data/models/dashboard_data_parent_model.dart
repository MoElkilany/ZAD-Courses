import '../../../Noticeboard/data/models/notice_model.dart';
import '../../domain/entities/dashboard_data_parent.dart';
import 'dependent.dart';

class DashboardDataParentModel extends DashboardDataParent {
  const DashboardDataParentModel({
    required super.notices,
    required super.dependents,
  });
  factory DashboardDataParentModel.fromJson(Map<String, dynamic> json) {
    return DashboardDataParentModel(
      dependents: (json['dependents'] as List).cast<Map<String, dynamic>>().map(DependentModel.fromJson).toList(),
      notices: (json['noticeboard']['data'] as List).cast<Map<String, dynamic>>().map(NoticeModel.fromJson).toList(),
    );
  }
}
