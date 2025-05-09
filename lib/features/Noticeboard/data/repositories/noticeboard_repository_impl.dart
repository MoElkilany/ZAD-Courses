import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../../../core/types/app_types.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../data_sources/noticeboard_remote_data_source.dart';
import '../../domain/entities/new_notice_options.dart';
import '../../domain/entities/noticeboard_data_student.dart';
import '../../domain/entities/noticeboard_data_teacher.dart';
import '../../domain/repositories/noticeboard_repository.dart';

class NoticeboardRepositoryImpl implements NoticeboardRepository {
  final NoticeboardRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  NoticeboardRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> submitNotice(
    String subject,
    String message,
    NoticeType ticketType,
    int? courseId,
  ) async {
    if (networkInfo.isConnected) {
      try {
        await remoteDataSource.submitNotice(
          subject,
          message,
          ticketType,
          courseId,
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
  Future<Either<Failure, NewNoticeOptions>> getNewNoticeOptions(NoParameters params) async {
    if (networkInfo.isConnected) {
      try {
        final newNoticeOptions = await remoteDataSource.getNewNoticeOptions();
        return Right(newNoticeOptions);
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
  Future<Either<Failure, NoticeboardDataStudent>> getNoticeboardDataStudent() async {
    if (networkInfo.isConnected) {
      try {
        final remoteQuizResults = await remoteDataSource.getNoticeboardDataStudent();

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
  Future<Either<Failure, NoticeboardDataTeacher>> getNoticeboardDataTeacher() async {
    if (networkInfo.isConnected) {
      try {
        final remoteQuizResults = await remoteDataSource.getNoticeboardDataTeacher();

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
