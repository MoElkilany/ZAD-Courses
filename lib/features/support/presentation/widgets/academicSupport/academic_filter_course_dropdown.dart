import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/colors.dart';
import '../../providers/academicProviders/academic_manager.dart';
import '../../../../../core/config/app_sized_box.dart';

class AcademicFilterCourseDropDown extends ConsumerStatefulWidget {
  const AcademicFilterCourseDropDown({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AcademicFilterCourseDropDownState();
}

class _AcademicFilterCourseDropDownState extends ConsumerState<AcademicFilterCourseDropDown> {
  @override
  Widget build(BuildContext context) {
    // final asgManager =
    //     ref.watch(studentAssignmentsListManagerProvider.notifier);
    final academicManager = ref.watch(academicManagerProvider.notifier);
    return Column(
      children: [
        Text(
          'support.course'.tr(),
          style: const TextStyle(
            fontSize: appFontSizeLarge,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<String>(
          value: academicManager.selectedCouse, //asgManager.selectedAssignment,
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
          hint: Text('support.selectCourse'.tr()),
          disabledHint: Text('support.selectCourse'.tr()),
          borderRadius: appBordRadCir8,
          onChanged: (String? newValue) {
            // asgManager.setSelectedAssignment(newValue);
            academicManager.setSelectedCourse(newValue);
            // log('${academicManager.selectedCouse}  ${academicManager.selectedUserType}');
            setState(() {});
          },
          items: academicManager.dropDownCourses, //asgManager.dropDownStudentAssignments,
        ),
        appSizeBoxH01,
        Text(
          'support.userType'.tr(),
          style: const TextStyle(
            fontSize: appFontSizeLarge,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<String>(
          value: academicManager.selectedUserType, //asgManager.selectedAssignment,
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
          hint: Text('support.selectUserType'.tr()),
          disabledHint: Text('support.selectUserType'.tr()),
          borderRadius: appBordRadCir8,
          onChanged: (String? newValue) {
            // asgManager.setSelectedAssignment(newValue);
            academicManager.setSelectedUserType(newValue);
            // log('${academicManager.selectedCouse}  ${academicManager.selectedUserType}');
            setState(() {});
          },
          items: academicManager.dropDownUserTypes, //asgManager.dropDownStudentAssignments,
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
