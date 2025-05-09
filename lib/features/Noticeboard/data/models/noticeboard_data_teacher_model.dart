import 'notice_model.dart';
import '../../domain/entities/noticeboard_data_teacher.dart';

class NoticeboardDataTeacherModel extends NoticeboardDataTeacher {
  const NoticeboardDataTeacherModel({
    required super.totalNoticeboards,
    required super.totalCourseNotices,
    required super.totalGeneralNoticies,
    required super.notices,
  });

  factory NoticeboardDataTeacherModel.fromJson(Map<String, dynamic> json) {
    return NoticeboardDataTeacherModel(
      totalNoticeboards: json['totalNoticeboards'],
      totalCourseNotices: json['totalCourseNotices'],
      totalGeneralNoticies: json['totalGeneralNotices'],
      notices: (json['noticeboards'] as List).map((e) => NoticeModel.fromJson(e)).toList(),
    );
  }
}
