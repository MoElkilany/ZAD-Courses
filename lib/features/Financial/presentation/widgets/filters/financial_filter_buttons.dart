import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../providers/financial_filter.dart';
import '../../providers/financial_lists_manager.dart';
import '../../../../../router/router_utils.dart';

class FinancialFilterButtons extends ConsumerStatefulWidget {
  const FinancialFilterButtons({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FinancialFilterButtonsState();
}

class _FinancialFilterButtonsState extends ConsumerState<FinancialFilterButtons> {
  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(financialFilterProvider.notifier);
    final docManager = ref.watch(financialListManagerProvider.notifier);

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
                  docManager.setFilteredDocuments();
                  Navigator.pop(context);
                  GoRouter.of(context).pushReplacement(AppPages.financial.toPath);

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
                  docManager.resetSelectedCourse();
                  docManager.resetFilteredDocuments();
                  Navigator.pop(context);
                  GoRouter.of(context).pushReplacement(AppPages.financial.toPath);
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
