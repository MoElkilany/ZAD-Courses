import 'package:flutter/widgets.dart';
import '../../../../core/types/app_types.dart';

@immutable
class NewNoticeState {
  final GlobalKey<FormState> formKey;
  final TextEditingController subjectController;
  final TextEditingController messageController;
  final NoticeType noticeType;
  final int? course;

  const NewNoticeState({
    required this.formKey,
    required this.subjectController,
    required this.messageController,
    required this.noticeType,
    required this.course,
  });

  factory NewNoticeState.initial() {
    return NewNoticeState(
      subjectController: TextEditingController(),
      messageController: TextEditingController(),
      noticeType: NoticeType.general,
      formKey: GlobalKey<FormState>(),
      course: null,
    );
  }

  NewNoticeState copyWith({
    TextEditingController? subjectController,
    TextEditingController? messageController,
    NoticeType? noticeType,
    GlobalKey<FormState>? formKey,
    required int? course,
  }) {
    return NewNoticeState(
      subjectController: subjectController ?? this.subjectController,
      messageController: messageController ?? this.messageController,
      noticeType: noticeType ?? this.noticeType,
      formKey: formKey ?? this.formKey,
      course: course,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewNoticeState &&
          runtimeType == other.runtimeType &&
          subjectController == other.subjectController &&
          messageController == other.messageController &&
          noticeType == other.noticeType &&
          formKey == other.formKey &&
          course == other.course;

  @override
  int get hashCode => subjectController.hashCode ^ messageController.hashCode ^ noticeType.hashCode ^ formKey.hashCode ^ course.hashCode;

  @override
  String toString() {
    return 'NewNoticeState{subjectController: $subjectController, messageController: $messageController, noticeType: $noticeType, formKey: $formKey, course: $course}';
  }
}
