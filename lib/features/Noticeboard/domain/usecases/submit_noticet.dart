//submit ticket UseCase

import 'package:dartz/dartz.dart';
import 'package:zad_test/core/error/failures.dart';
import 'package:zad_test/core/usecase/usecase.dart';
import 'package:zad_test/features/Noticeboard/domain/entities/notice_request.dart';
import 'package:zad_test/features/Noticeboard/domain/repositories/noticeboard_repository.dart';

/// A use case that submits a ticket request to the repository.
///
/// This use case takes in a [NoticeRequest] object and submits it to the [NoticeboardRepository]
/// to create a new notice. It returns a [Failure] if the submission fails, otherwise it
/// returns [void].
class SubmitNewNotice extends UseCase<bool, NoticeRequest> {
  final NoticeboardRepository repository;

  SubmitNewNotice({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool>> call(NoticeRequest params) async {
    return await repository.submitNotice(params.subject, params.message, params.noticeType, params.course);
  }
}
