import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import 'noticeboard_filter_buttons.dart';
import 'noticeboard_filter_course_dropdown.dart';
import 'noticeboard_filter_time_range.dart';

class NoticeboardFilterCollumn extends ConsumerStatefulWidget {
  const NoticeboardFilterCollumn({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NoticeboardFilterCollumnState();
}

class _NoticeboardFilterCollumnState extends ConsumerState<NoticeboardFilterCollumn> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appSizeBoxH05,
        Padding(
          padding: appPaddingDirecS8,
          child: Text(
            'assignments.filters'.tr(),
            style: const TextStyle(
              fontSize: appFontSizeHuge,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        appSizeBoxH01,
        const Divider(
          thickness: 1,
        ),
        appSizeBoxH01,
        const Padding(
          padding: appPaddingDirecS8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NoticeboardFilterCourseDropDown(),
              NoticeboardFilterSubmissionRange(),
            ],
          ),
        ),
        appSizeBoxH01,
        const Divider(
          thickness: 1,
        ),
        appSizeBoxH01,
        const NoticeboardFilterButtons(),
      ],
    );
  }
}
