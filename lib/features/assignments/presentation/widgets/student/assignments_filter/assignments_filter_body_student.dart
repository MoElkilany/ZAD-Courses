import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/config/app_font_size.dart';
import '../../../../../../core/config/app_padding.dart';
import '../../../../../../core/config/app_sized_box.dart';
import 'assignments_filter_buttons_student.dart';
import 'assignments_filter_course_dropdown_student.dart';
import 'assignments_filter_status_checkbox_student.dart';
import 'assignments_filter_submission_range_student.dart';

class StudentFilterCollumn extends ConsumerStatefulWidget {
  const StudentFilterCollumn({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StudentFilterCollumnState();
}

class _StudentFilterCollumnState extends ConsumerState<StudentFilterCollumn> {
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
            style: const TextStyle(fontSize: appFontSizeHuge, fontWeight: FontWeight.bold),
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
              AssignmentsFilterCourseDropDownStudent(),
              AssignmentsFilterStatusCheckboxStudent(),
              AssignmentsFilterSubmissionRangeStudent(),
            ],
          ),
        ),
        appSizeBoxH01,
        const Divider(
          thickness: 1,
        ),
        appSizeBoxH01,
        const AssignmentsFilterButtonsStudent(),
      ],
    );
  }
}
