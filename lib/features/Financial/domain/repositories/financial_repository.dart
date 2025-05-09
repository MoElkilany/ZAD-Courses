import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/financial_data_student.dart';
import '../entities/financial_data_teacher.dart';

abstract class FinancialRepository {
  //student
  Future<Either<Failure, FinancialDataStudent>> getFinancialDataStudent();

  //teacher
  Future<Either<Failure, FinancialDataTeacher>> getFinancialDataTeacher();
}
