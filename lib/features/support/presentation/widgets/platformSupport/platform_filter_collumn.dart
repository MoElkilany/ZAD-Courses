import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import 'platform_filter_butons.dart';
import 'platform_filter_course_dropdown.dart';
import 'platform_filter_status_checkbox.dart';
import 'platform_filter_submission_range.dart';

class PlatformFilterCollumn extends ConsumerStatefulWidget {
  const PlatformFilterCollumn({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlatformFilterCollumnState();
}

class _PlatformFilterCollumnState extends ConsumerState<PlatformFilterCollumn> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
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
              // AssignmentsFilterCourseDropDownStudent(),
              PlatformFilterCourseDropDown(),
              // AssignmentsFilterStatusCheckboxStudent(),
              PlatformFilterStatusCheckbox(),
              // AssignmentsFilterSubmissionRangeStudent(),
              PlatformFilterSubmissionRange(),
            ],
          ),
        ),
        appSizeBoxH01,
        const Divider(
          thickness: 1,
        ),
        appSizeBoxH01,
        const PlatformFilterButtons(),
      ],
    );
  }
}
