import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/config/app_font_size.dart';
import '../../../../../../core/config/app_padding.dart';
import '../../../../../../core/config/app_sized_box.dart';
import 'assignments_filter_buttons_teacher.dart';
import 'assignments_filter_course_dropdown_teacher.dart';
import 'assignments_filter_status_checkbox_teacher.dart';

class TeacherFilterCollumn extends StatelessWidget {
  const TeacherFilterCollumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
              AssignmentsFilterCourseDropDownTeacher(),
              AssignmentsFilterStatusCheckboxTeacher(),
            ],
          ),
        ),
        appSizeBoxH01,
        const AssignmentsFilterButtonsTeacher(),
      ],
    );
  }
}
