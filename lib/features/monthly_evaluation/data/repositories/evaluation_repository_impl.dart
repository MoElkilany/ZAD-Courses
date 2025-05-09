import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/evaluation.dart';
import '../../domain/entities/evaluation_details.dart';
import '../../domain/entities/evaluations_data.dart';
import '../../domain/repositories/evaluation_repository.dart';
import '../data_sources/monthly_evaluation_remote_data_source.dart';

class EvaluationRepositoryImpl implements EvaluationRepository {
  final MonthlyEvaluationRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  EvaluationRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, EvaluationData>> getEvaluations() async {
    if (networkInfo.isConnected) {
      try {
        final remoteQuizResults = await remoteDataSource.getEvaluations();

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

  @override
  Future<Either<Failure, EvaluationDetails>> getEvaluationDetails(MonthlyEvaluation e) async {
    if (networkInfo.isConnected) {
      try {
        final remoteQuizResults = await remoteDataSource.getEvaluationDetails(e);

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
