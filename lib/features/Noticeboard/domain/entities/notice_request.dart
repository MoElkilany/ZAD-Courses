//ticket request entity

import 'package:zad_test/core/types/app_types.dart';

class NoticeRequest {
  final String subject;
  final String message;
  final NoticeType noticeType;

  final int? course;

  NoticeRequest({
    required this.subject,
    required this.message,
    required this.noticeType,
    required this.course,
  });
}
