import 'notice_model.dart';
import '../../domain/entities/noticeboard_data_student.dart';

class NoticeboardDataStudentModel extends NoticeboardDataStudent {
  const NoticeboardDataStudentModel({
    required super.totalNoticeboards,
    required super.totalCourseNotices,
    required super.totalGeneralNoticies,
    required super.notices,
  });

  factory NoticeboardDataStudentModel.fromJson(Map<String, dynamic> json) {
    return NoticeboardDataStudentModel(
      totalNoticeboards: json['totalNoticeboards'],
      totalCourseNotices: json['totalCourseNotices'],
      totalGeneralNoticies: json['totalGeneralNotices'],
      notices: (json['noticeboards'] as List)
          .map(
            (e) => NoticeModel.fromJson(e),
          )
          .toList(),
    );
  }
}
