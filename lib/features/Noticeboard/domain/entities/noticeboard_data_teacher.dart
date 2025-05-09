import 'package:equatable/equatable.dart';

import 'notice.dart';

class NoticeboardDataTeacher extends Equatable {
  final int totalNoticeboards;
  final int totalCourseNotices;
  final int totalGeneralNoticies;

  final List<Notice> notices;

  const NoticeboardDataTeacher({
    required this.totalNoticeboards,
    required this.totalCourseNotices,
    required this.totalGeneralNoticies,
    required this.notices,
  });
  @override
  List<Object?> get props => [
        totalNoticeboards,
        totalCourseNotices,
        totalGeneralNoticies,
        notices,
      ];
}
