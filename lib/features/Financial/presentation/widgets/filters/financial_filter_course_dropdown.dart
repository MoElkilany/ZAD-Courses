import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/config/app_border.dart';
import '../../providers/financial_lists_manager.dart';

class FinancialFilterCourseDropDown extends ConsumerStatefulWidget {
  const FinancialFilterCourseDropDown({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FinancialFilterCourseDropDownState();
}

class _FinancialFilterCourseDropDownState extends ConsumerState<FinancialFilterCourseDropDown> {
  @override
  Widget build(BuildContext context) {
    final docManager = ref.watch(financialListManagerProvider.notifier);
    return Column(
      children: [
        Text(
          'financial.course'.tr(),
          style: const TextStyle(
            fontSize: appFontSizeLarge,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<String>(
          value: docManager.selectedCourse,
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
          hint: Text('financial.filter.selectCourse'.tr()),
          disabledHint: Text('financial.filter.selectCourse'.tr()),
          borderRadius: appBordRadCir8,
          onChanged: (String? newValue) {
            docManager.setSelectedCoure(newValue);
            setState(() {});
          },
          items: docManager.dropDownCourses,
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
