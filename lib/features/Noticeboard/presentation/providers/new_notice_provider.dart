import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/types/app_types.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../../../../di/noticeboard.dart';
import '../../domain/entities/new_notice_options.dart';
import '../../domain/entities/notice_request.dart';
import 'new_notice_state.dart';
part 'new_notice_provider.g.dart';

@riverpod
Future<Either<Failure, NewNoticeOptions>> getNewNoticeOptions(
  Ref ref,
) async {
  final getNewnoticeOptions = ref.read(NoticeboardDI.getNewNoticeOptions);
  final res = await getNewnoticeOptions(NoParameters());
  final noticeOptions = res.fold((l) => null, (r) => r);
  if (noticeOptions != null) {
    final newTicketController = ref.read(newNoticeControllerProvider.notifier);
    newTicketController.resetNotice();
    //set courses
    newTicketController.setNoticeCourse(noticeOptions.courses[0].value1);
  }

  return res;
}

@Riverpod(keepAlive: false)
class NewNoticeController extends _$NewNoticeController {
  @override
  NewNoticeState build() {
    return NewNoticeState(
      noticeType: NoticeType.general,
      messageController: TextEditingController(),
      subjectController: TextEditingController(),
      formKey: GlobalKey<FormState>(),
      course: null,
    );
  }

  //getters
  GlobalKey<FormState> get formKey => state.formKey;
  TextEditingController get subjectController => state.subjectController;
  TextEditingController get messageController => state.messageController;
  NoticeType get noticeType => state.noticeType;
  int? get course => state.course;

  void setNoticeTitle(TextEditingController subjcectController) {
    state = state.copyWith(
      subjectController: subjcectController,
      course: state.course,
    );
  }

  void setNoticeDescription(TextEditingController messageController) {
    state = state.copyWith(
      messageController: messageController,
      course: state.course,
    );
  }

  void setNoticeType(NoticeType noticeType) {
    state = state.copyWith(
      noticeType: noticeType,
      course: state.course,
    );
  }

  void setNoticeCourse(int? course) {
    state = state.copyWith(
      course: course,
    );
  }

  void resetNotice() {
    state = NewNoticeState.initial();
  }

  NoticeRequest getTicket() {
    return NoticeRequest(
      subject: subjectController.text,
      message: messageController.text,
      noticeType: noticeType,
      course: course,
    );
  }
}
