//submit ticket UseCase

import 'package:dartz/dartz.dart';
import 'package:zad_test/core/error/failures.dart';
import 'package:zad_test/core/usecase/no_parameters.dart';
import 'package:zad_test/core/usecase/usecase.dart';
import 'package:zad_test/features/Noticeboard/domain/entities/new_notice_options.dart';
import 'package:zad_test/features/Noticeboard/domain/repositories/noticeboard_repository.dart';

class GetNewNoticeOptions extends UseCase<NewNoticeOptions, NoParameters> {
  final NoticeboardRepository repository;

  GetNewNoticeOptions({
    required this.repository,
  });

  @override
  Future<Either<Failure, NewNoticeOptions>> call(NoParameters params) async {
    return await repository.getNewNoticeOptions(params);
  }
}
