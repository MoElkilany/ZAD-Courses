import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/types/app_types.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../entities/new_notice_options.dart';
import '../entities/noticeboard_data_student.dart';
import '../entities/noticeboard_data_teacher.dart';

abstract class NoticeboardRepository {
  Future<Either<Failure, bool>> submitNotice(
    String subject,
    String message,
    NoticeType ticketType,
    int? courseId,
  );

  Future<Either<Failure, NewNoticeOptions>> getNewNoticeOptions(NoParameters params);

  //student
  Future<Either<Failure, NoticeboardDataStudent>> getNoticeboardDataStudent();

  //teacher
  Future<Either<Failure, NoticeboardDataTeacher>> getNoticeboardDataTeacher();
}
