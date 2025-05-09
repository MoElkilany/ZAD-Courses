import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/financial_data_student.dart';
import '../entities/financial_data_teacher.dart';
import '../repositories/financial_repository.dart';

class GetFinancialDataStudent extends UseCase<FinancialDataStudent, NoParameters> {
  final FinancialRepository repository;

  GetFinancialDataStudent({
    required this.repository,
  });

  @override
  Future<Either<Failure, FinancialDataStudent>> call(NoParameters params) async {
    return await repository.getFinancialDataStudent();
  }
}

class GetFinancialDataTeacher extends UseCase<FinancialDataTeacher, NoParameters> {
  final FinancialRepository repository;

  GetFinancialDataTeacher({
    required this.repository,
  });

  @override
  Future<Either<Failure, FinancialDataTeacher>> call(NoParameters params) async {
    return await repository.getFinancialDataTeacher();
  }
}
