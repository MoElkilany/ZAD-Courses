import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/filters.dart';
import '../../domain/entities/progress.dart';
import '../../domain/entities/progress_req.dart';
import '../../domain/repositories/progress_repository.dart';
import '../data_sources/progress_remote_data_source.dart';

class ProgressRepositoryImpl implements ProgressRepository {
  final ProgressRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProgressRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Progress>> getProgress(ProgressReq req) async {
    if (networkInfo.isConnected) {
      try {
        final remoteQuizResults = await remoteDataSource.getProgresss(req);

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
  Future<Either<Failure, Filters>> getFilters() async {
    if (networkInfo.isConnected) {
      try {
        final remoteQuizResults = await remoteDataSource.getFilters();

        return Right(remoteQuizResults);
      } catch (e) {
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
