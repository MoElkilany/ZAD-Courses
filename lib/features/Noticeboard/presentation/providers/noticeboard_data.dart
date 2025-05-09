import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failures.dart';
import '../../../../di/noticeboard.dart';
import '../../domain/entities/noticeboard_data_student.dart';
import '../../domain/entities/noticeboard_data_teacher.dart';
import 'noticeboard_lists_manager.dart';

part 'noticeboard_data.g.dart';

@riverpod
Future<Either<Failure, NoticeboardDataStudent>> getNoticeboardDataStudent(
  Ref ref,
) async {
  final noticeboardDataRepo = ref.read(NoticeboardDI.noticeboardRepository);
  final res = await noticeboardDataRepo.getNoticeboardDataStudent();
  if (res.isRight()) {
    final notices = res.getOrElse(() => throw Exception()).notices;
    //sort notices by date created, newest first
    notices.sort((a, b) {
      if (a.date != null && b.date != null) {
        return b.date!.compareTo(a.date!);
      }
      return 0;
    });
    ref.watch(noticeboardListManagerProvider.notifier).setAllNotices(notices);
    ref.watch(noticeboardListManagerProvider.notifier).initFilteredNotices(notices);
  }
  return res;
}

@riverpod
Future<Either<Failure, NoticeboardDataTeacher>> getNoticeboardDataTeacher(
  Ref ref,
) async {
  final noticeboardDataRepo = ref.read(NoticeboardDI.noticeboardRepository);
  final res = await noticeboardDataRepo.getNoticeboardDataTeacher();
  if (res.isRight()) {
    final notices = res.getOrElse(() => throw Exception()).notices;
    //sort notices by date created, newest first
    notices.sort((a, b) {
      if (a.date != null && b.date != null) {
        return b.date!.compareTo(a.date!);
      }
      return 0;
    });
    ref.watch(noticeboardListManagerProvider.notifier).setAllNotices(notices);
    ref.watch(noticeboardListManagerProvider.notifier).initFilteredNotices(notices);
  }
  return res;
}
