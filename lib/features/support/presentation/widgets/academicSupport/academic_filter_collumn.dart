import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import 'academic_filter_butons.dart';
import 'academic_filter_course_dropdown.dart';
import 'academic_filter_status_checkbox.dart';
import 'academic_filter_submission_range.dart';

class AcademicFilterCollumn extends ConsumerStatefulWidget {
  const AcademicFilterCollumn({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AcademicFilterCollumnState();
}

class _AcademicFilterCollumnState extends ConsumerState<AcademicFilterCollumn> {
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
              AcademicFilterCourseDropDown(),
              AcademicFilterStatusCheckbox(),
              AcademicFilterSubmissionRange(),
            ],
          ),
        ),
        appSizeBoxH01,
        const Divider(
          thickness: 1,
        ),
        appSizeBoxH01,
        const AcademicFilterButtons(),
      ],
    );
  }
}
