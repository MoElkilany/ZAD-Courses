import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/colors.dart';
import '../../providers/platformProviders/platform_manager.dart';
import '../../../../../core/config/app_sized_box.dart';

class PlatformFilterCourseDropDown extends ConsumerStatefulWidget {
  const PlatformFilterCourseDropDown({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlatformFilterCourseDropDownState();
}

class _PlatformFilterCourseDropDownState extends ConsumerState<PlatformFilterCourseDropDown> {
  @override
  Widget build(BuildContext context) {
    // final asgManager =
    //     ref.watch(studentAssignmentsListManagerProvider.notifier);
    final platformManager = ref.watch(platformManagerProvider.notifier);
    return Column(
      children: [
        Text(
          'support.department'.tr(),
          style: const TextStyle(
            fontSize: appFontSizeLarge,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<String>(
          value: platformManager.selectedDepartment, //asgManager.selectedAssignment,
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
          hint: Text('support.selectDepartment'.tr()),
          disabledHint: Text('support.selectDepartment'.tr()),
          borderRadius: appBordRadCir8,
          onChanged: (String? newValue) {
            // asgManager.setSelectedAssignment(newValue);
            platformManager.setSelectedDepartment(newValue);
            setState(() {});
          },
          items: platformManager.dropDownDepartments, //asgManager.dropDownStudentAssignments,
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
