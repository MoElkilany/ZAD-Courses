import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/config/app_font_size.dart';
import '../../../../../../core/config/app_padding.dart';
import '../../../../../../core/config/app_sized_box.dart';
import '../../../../../../core/config/colors.dart';
import '../../../../../../core/config/app_border.dart';
import '../../../providers/assignment_lists_manager_teacher.dart';

class AssignmentsFilterCourseDropDownTeacher extends ConsumerStatefulWidget {
  const AssignmentsFilterCourseDropDownTeacher({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AssignmentsFilterCourseDropDownState();
}

class _AssignmentsFilterCourseDropDownState extends ConsumerState<AssignmentsFilterCourseDropDownTeacher> {
  @override
  Widget build(BuildContext context) {
    final asgManager = ref.watch(teacherAssignmentsListManagerProvider.notifier);
    return Column(
      children: [
        Text(
          'assignments.courseClass'.tr(),
          style: const TextStyle(
            fontSize: appFontSizeLarge,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<String>(
          value: asgManager.selectedAssignment,
          isExpanded: true,
          icon: const Padding(
            padding: appPaddingAll8,
            child: Icon(
              Icons.arrow_downward,
            ),
          ),
          iconSize: 14,
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: kPrimary,
          ),
          hint: Text('assignments.selectSession'.tr()),
          disabledHint: Text('assignments.selectSession'.tr()),
          borderRadius: appBordRadCir8,
          onChanged: (String? newValue) {
            asgManager.setSelectedAssignment(newValue);
            setState(() {});
          },
          items: asgManager.dropDownTeacherAssignments,
        ),
        appSizeBoxH01,
        const Divider(
          thickness: 1,
        ),
        appSizeBoxH01,
      ],
    );
  }
}
