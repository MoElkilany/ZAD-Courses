import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import 'financial_filter_buttons.dart';
import 'financial_filter_course_dropdown.dart';
import 'student/financial_filter_transaction_dropdown.dart';
import 'financial_filter_time_range.dart';

class FinancialFilterCollumn extends ConsumerStatefulWidget {
  const FinancialFilterCollumn({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FinancialFilterCollumnState();
}

class _FinancialFilterCollumnState extends ConsumerState<FinancialFilterCollumn> {
  @override
  Widget build(BuildContext context) {
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
              FinancialFilterCourseDropDown(),
              FinancialFilterTransactionCheckbox(),
              FinancialFilterTimeRange(),
            ],
          ),
        ),
        appSizeBoxH01,
        const Divider(
          thickness: 1,
        ),
        appSizeBoxH01,
        const FinancialFilterButtons(),
      ],
    );
  }
}
