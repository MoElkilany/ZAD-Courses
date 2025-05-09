import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/noticeboard_data_student.dart';
import '../entities/noticeboard_data_teacher.dart';
import '../repositories/noticeboard_repository.dart';

class GetNoticeboardDataStudent extends UseCase<NoticeboardDataStudent, NoParameters> {
  final NoticeboardRepository repository;

  GetNoticeboardDataStudent({
    required this.repository,
  });

  @override
  Future<Either<Failure, NoticeboardDataStudent>> call(NoParameters params) async {
    return await repository.getNoticeboardDataStudent();
  }
}

class GetNoticeboardDataTeacher extends UseCase<NoticeboardDataTeacher, NoParameters> {
  final NoticeboardRepository repository;

  GetNoticeboardDataTeacher({
    required this.repository,
  });

  @override
  Future<Either<Failure, NoticeboardDataTeacher>> call(NoParameters params) async {
    return await repository.getNoticeboardDataTeacher();
  }
}
