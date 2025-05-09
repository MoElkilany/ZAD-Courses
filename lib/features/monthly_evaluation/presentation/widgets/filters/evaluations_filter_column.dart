import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import 'evaluation_filter_time_range.dart';
import 'evaluations_filter_buttons.dart';
import 'evaluations_filter_course_dropdown.dart';

class EvaluationsFilterCollumn extends ConsumerWidget {
  const EvaluationsFilterCollumn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              EvaluationsFilterCourseDropDown(),
              EvaluationsFilterSubmissionRange(),
            ],
          ),
        ),
        appSizeBoxH01,
        const Divider(
          thickness: 1,
        ),
        appSizeBoxH01,
        const EvaluationsFilterButtons(),
      ],
    );
  }
}
