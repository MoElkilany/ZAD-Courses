import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/dashboard_data_parent.dart';
import '../entities/dashboard_data_student.dart';
import '../entities/dashboard_data_teacher.dart';
import '../repositories/dashboard_repository.dart';

class GetDashboardDataStudent extends UseCase<DashboardDataStudent, NoParameters> {
  final DashboardRepository repository;

  GetDashboardDataStudent({
    required this.repository,
  });

  @override
  Future<Either<Failure, DashboardDataStudent>> call(NoParameters params) async {
    return await repository.getDashboardDataStudent();
  }
}

class GetDashboardDataTeacher extends UseCase<DashboardDataTeacher, NoParameters> {
  final DashboardRepository repository;

  GetDashboardDataTeacher({
    required this.repository,
  });

  @override
  Future<Either<Failure, DashboardDataTeacher>> call(NoParameters params) async {
    return await repository.getDashboardDataTeacher();
  }
}

class GetDashboardDataParent extends UseCase<DashboardDataParent, NoParameters> {
  final DashboardRepository repository;

  GetDashboardDataParent({
    required this.repository,
  });

  @override
  Future<Either<Failure, DashboardDataParent>> call(NoParameters params) async {
    return await repository.getDashboardDataParent();
  }
}
