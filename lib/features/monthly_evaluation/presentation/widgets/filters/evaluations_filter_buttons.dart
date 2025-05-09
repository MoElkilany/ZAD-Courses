import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../providers/evaluations_filter.dart';

class EvaluationsFilterButtons extends ConsumerWidget {
  const EvaluationsFilterButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateNotifier = ref.read(evaluationsDateFilterProvider.notifier);
    final courseNotifier = ref.read(evaluationsCourseFilterProvider.notifier);
    return Column(
      children: [
        Center(
          child: //reset button
              Container(
            decoration: BoxDecoration(
              borderRadius: appBordRadCir8,
              color: kGray.withOpacity(0.2),
            ),
            child: Padding(
              padding: appPaddingSymH12,
              child: TextButton(
                onPressed: () {
                  // manager.setFilteredNotices();
                  Navigator.pop(context);

                  // widget.callback();
                },
                child: Text(
                  'assignments.show'.tr(),
                  style: const TextStyle(
                    color: kDark,
                    fontSize: appFontSizeMedium,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        appSizeBoxH01,
        Center(
          child: //reset button
              Container(
            decoration: const BoxDecoration(
              borderRadius: appBordRadCir8,
              color: kSecondary,
            ),
            child: Padding(
              padding: appPaddingSymH12,
              child: TextButton(
                onPressed: () {
                  dateNotifier.update((_) => null);
                  courseNotifier.update((_) => null);
                  Navigator.pop(context);
                },
                child: Text(
                  'assignments.reset'.tr(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: appFontSizeMedium,
                  ),
                ),
              ),
            ),
          ),
        ),
        appSizeBoxH05,
      ],
    );
  }
}
