import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../../../core/types/app_types.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../data_sources/ticket_remote_data_source.dart';
import '../../domain/entities/academic_support_history.dart';
import '../../domain/entities/new_ticket_options.dart';
import '../../domain/entities/platform_support_history.dart';
import '../../domain/repositories/ticket_repository.dart';

class TicketRepositoryImpl implements TicketRepository {
  final TicketRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TicketRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  /// Returns a [bool] if success or not.
  ///
  /// Throws a [ServerException] for all error codes.
  ///
  /// Returns a [ServerFailure] for all error codes.
  ///
  /// Returns a [CacheFailure] for all cache errors.
  @override
  Future<Either<Failure, bool>> submitTicket(
    String subject,
    String message,
    TicketType ticketType,
    int? courseId,
    int? roleId,
    int? departmentID,
    List<String> attachments,
  ) async {
    if (networkInfo.isConnected) {
      try {
        await remoteDataSource.submitTicket(
          subject,
          message,
          ticketType,
          courseId,
          roleId,
          departmentID,
          attachments,
        );
        return const Right(true);
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
  Future<Either<Failure, NewTicketOptions>> getNewTicketOptions(NoParameters params) async {
    if (networkInfo.isConnected) {
      try {
        final newTicketOptions = await remoteDataSource.getNewTicketOptions();
        return Right(newTicketOptions);
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
  Future<Either<Failure, AcademicSupportHistory>> getAcademicSupportHistory(NoParameters params) async {
    if (networkInfo.isConnected) {
      try {
        final academicSupportHistory = await remoteDataSource.getAcademicSupportHistory();
        return Right(academicSupportHistory);
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
  Future<Either<Failure, PlatformSupportHistory>> getPlatformSupportHistory(NoParameters params) async {
    if (networkInfo.isConnected) {
      try {
        final platformSupportHistory = await remoteDataSource.getPlatformSupportHistory();
        return Right(platformSupportHistory);
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
