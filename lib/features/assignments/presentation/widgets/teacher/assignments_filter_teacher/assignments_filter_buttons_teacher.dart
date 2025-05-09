import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/config/app_border.dart';
import '../../../../../../core/config/app_font_size.dart';
import '../../../../../../core/config/app_padding.dart';
import '../../../../../../core/config/app_sized_box.dart';
import '../../../../../../core/config/colors.dart';
import '../../../providers/assignment_lists_manager_teacher.dart';
import '../../../providers/assignments_filter.dart';

class AssignmentsFilterButtonsTeacher extends ConsumerStatefulWidget {
  const AssignmentsFilterButtonsTeacher({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AssignmentsFilterButtonsState();
}

class _AssignmentsFilterButtonsState extends ConsumerState<AssignmentsFilterButtonsTeacher> {
  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(teacherAssignmentsFilterProvider.notifier);
    final asgManager = ref.watch(teacherAssignmentsListManagerProvider.notifier);

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
                  asgManager.setFilteredAssignments();
                  Navigator.pop(context);
                  GoRouter.of(context).pushReplacement('/assignments');

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
                  filter.resetAll();
                  setState(() {});
                  asgManager.resetSelectedAssignment();
                  asgManager.resetFilteredAssignments();
                  Navigator.pop(context);
                  GoRouter.of(context).pushReplacement('/assignments');
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
