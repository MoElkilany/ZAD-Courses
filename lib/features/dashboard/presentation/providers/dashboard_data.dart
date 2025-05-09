import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/types/app_types.dart';
import '../../../../di/dashboard.dart';
import '../../domain/entities/dashboard_data_parent.dart';
import '../../domain/entities/dashboard_data_student.dart';
import '../../domain/entities/dashboard_data_teacher.dart';

part 'dashboard_data.g.dart';

@riverpod
Future<Either<Failure, DashboardDataStudent>> getDashboardDataStudent(
  Ref ref,
) async {
  final dashboardDataRepo = ref.read(DashboardDI.dashboardRepository);
  final res = await dashboardDataRepo.getDashboardDataStudent();
  return res;
}

@riverpod
Future<Either<Failure, DashboardDataTeacher>> getDashboardDataTeacher(
  Ref ref,
) async {
  final dashboardDataRepo = ref.read(DashboardDI.dashboardRepository);
  final res = await dashboardDataRepo.getDashboardDataTeacher();
  return res;
}

@riverpod
Future<Either<Failure, DashboardDataParent>> getDashboardDataParent(
  Ref ref,
) async {
  final dashboardDataRepo = ref.read(DashboardDI.dashboardRepository);
  final res = await dashboardDataRepo.getDashboardDataParent();
  return res;
}

@Riverpod()
class LineChartYear extends _$LineChartYear {
  @override
  LineChartType build() {
    return LineChartType.thisYear;
  }

  void setLineChartyear(LineChartType year) {
    state = year;
  }
}
