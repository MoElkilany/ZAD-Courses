import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/app_font_size.dart';
import '../../../../core/config/app_sized_box.dart';
import '../../../app_parent/presentation/providers/app_parent_states.dart';
import 'financial_stat_grid_student.dart';

class FinancialHeader extends ConsumerWidget {
  const FinancialHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final isTeacher = ref.watch(AppParentStates.appUserInfo)!.isTeacher();
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'financial.financialSummary'.tr(),
            style: const TextStyle(
              fontSize: appFontSizeVeryLarge,
              fontWeight: FontWeight.bold,
            ),
          ),
          appSizeBoxH01,
          if (!isTeacher)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FinancialStatGridStudent(),
                appSizeBoxH01,
                AutoSizeText(
                  'financial.financialDocuments'.tr(),
                  style: const TextStyle(
                    fontSize: appFontSizeVeryLarge,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                appSizeBoxH01,
              ],
            )
        ],
      ),
    );
  }
}
