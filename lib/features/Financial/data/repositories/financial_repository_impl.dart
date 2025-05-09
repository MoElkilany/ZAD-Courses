import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../data_sources/financial_remote_data_source.dart';
import '../../domain/entities/financial_data_student.dart';
import '../../domain/entities/financial_data_teacher.dart';
import '../../domain/repositories/financial_repository.dart';

class FinancialRepositoryImpl implements FinancialRepository {
  final FinancialRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  FinancialRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, FinancialDataStudent>> getFinancialDataStudent() async {
    if (networkInfo.isConnected) {
      try {
        final remoteFinData = await remoteDataSource.getFinancialDataStudent();

        return Right(remoteFinData);
      } on ServerException {
        return Left(ServerFailure(
          status: 500,
          message: 'errors.serverError'.tr(),
        ));
      }
    } else {
      return Left(ServerFailure(
        status: 500,
        message: 'errors.serverError'.tr(),
      ));
    }
  }

  @override
  Future<Either<Failure, FinancialDataTeacher>> getFinancialDataTeacher() async {
    if (networkInfo.isConnected) {
      try {
        final remoteQuizResults = await remoteDataSource.getFinancialDataTeacher();

        return Right(remoteQuizResults);
      } on ServerException {
        return Left(ServerFailure(
          status: 500,
          message: 'errors.serverError'.tr(),
        ));
      }
    } else {
      return Left(ServerFailure(
        status: 500,
        message: 'errors.serverError'.tr(),
      ));
    }
  }
}
