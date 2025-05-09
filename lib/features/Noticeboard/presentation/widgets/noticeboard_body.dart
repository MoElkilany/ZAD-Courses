import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/app_padding.dart';
import '../../../../core/config/app_progress_indicators.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/widgets/error/error_page.dart';
import '../providers/noticeboard_data.dart';
import 'noticeboard_header.dart';
import 'noticeboard_list.dart';
import 'noticeboard_search_and_filters.dart';
import '../../../app_parent/presentation/providers/app_parent_states.dart';

class NoticeboardBody extends ConsumerWidget {
  const NoticeboardBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTeacher = ref.watch(AppParentStates.appUserInfo)!.isTeacher();
    final noticeboardData = isTeacher ? ref.watch(getNoticeboardDataTeacherProvider) : ref.watch(getNoticeboardDataStudentProvider);
    return RefreshIndicator(
      onRefresh: () async {
        if (isTeacher) {
          ref.invalidate(getNoticeboardDataTeacherProvider);
        } else {
          ref.invalidate(getNoticeboardDataStudentProvider);
        }
      },
      color: kWhite,
      backgroundColor: kSecondary,
      child: Padding(
        padding: appPaddingSymmetricWidth02,
        child: noticeboardData.when(
          skipLoadingOnRefresh: false,
          data: (data) {
            final d = data.fold((l) => null, (r) => r as dynamic);
            if (d == null) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ErrorPage(
                  errorMessage: 'errors.serverError'.tr(),
                ),
              );
            }
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  if (isTeacher) NoticeboardHeader(dataTeacher: d),
                  if (!isTeacher) NoticeboardHeader(dataStudent: d),
                  const NoticeboardSearchAndFilter(),
                  const NoticeboardList(),
                ],
              ),
            );
          },
          error: (error, stackTrace) => ErrorPage(
            errorMessage: 'errors.serverError'.tr(),
          ),
          loading: () => appDefaultCircIndicator,
        ),
      ),
    );
  }
}
