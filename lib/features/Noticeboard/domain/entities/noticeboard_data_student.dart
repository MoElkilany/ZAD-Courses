import 'package:equatable/equatable.dart';
import 'notice.dart';

class NoticeboardDataStudent extends Equatable {
  final int totalNoticeboards;
  final int totalCourseNotices;
  final int totalGeneralNoticies;

  final List<Notice> notices;

  const NoticeboardDataStudent({
    required this.totalNoticeboards,
    required this.totalCourseNotices,
    required this.totalGeneralNoticies,
    required this.notices,
  });
  @override
  List<Object?> get props => [
        notices,
        totalCourseNotices,
        totalGeneralNoticies,
        totalNoticeboards,
      ];
}
