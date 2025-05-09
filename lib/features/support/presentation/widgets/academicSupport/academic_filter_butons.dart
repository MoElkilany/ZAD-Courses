import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../providers/academicProviders/academic_filter.dart';
import '../../providers/academicProviders/academic_manager.dart';

class AcademicFilterButtons extends ConsumerStatefulWidget {
  const AcademicFilterButtons({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AcademicFilterButtonsState();
}

class _AcademicFilterButtonsState extends ConsumerState<AcademicFilterButtons> {
  @override
  Widget build(BuildContext context) {
    // final filter = ref.watch(studentAssignmentsFilterProvider.notifier);
    // final asgManager =
    //     ref.watch(studentAssignmentsListManagerProvider.notifier);
    final academicFilter = ref.watch(academicFilterProvider.notifier);
    final academicManager = ref.watch(academicManagerProvider.notifier);

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
                  academicManager.setFilteredTickets();
                  Navigator.pop(context);
                  GoRouter.of(context).pushReplacement('/academicSupportHistory');
                },
                child: Text(
                  'support.show'.tr(),
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
                  academicFilter.resetAll();
                  setState(() {});
                  academicManager.resetSelectedCourse();
                  academicManager.resetSelectedUserType();
                  academicManager.resetFilteredTickets();
                  Navigator.pop(context);
                  GoRouter.of(context).pushReplacement('/academicSupportHistory');
                },
                child: Text(
                  'support.reset'.tr(),
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
