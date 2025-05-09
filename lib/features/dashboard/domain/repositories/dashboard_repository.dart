import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/dashboard_data_parent.dart';
import '../entities/dashboard_data_student.dart';
import '../entities/dashboard_data_teacher.dart';

abstract class DashboardRepository {
  //student
  Future<Either<Failure, DashboardDataStudent>> getDashboardDataStudent();

  //teacher
  Future<Either<Failure, DashboardDataTeacher>> getDashboardDataTeacher();

  //teacher
  Future<Either<Failure, DashboardDataParent>> getDashboardDataParent();
}
