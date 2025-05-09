import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/config/app_sized_box.dart';
import '../../../providers/financial_filter.dart';

class FinancialFilterTransactionCheckbox extends ConsumerStatefulWidget {
  const FinancialFilterTransactionCheckbox({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FinancialFilterTransactionDropDownState();
}

class _FinancialFilterTransactionDropDownState extends ConsumerState<FinancialFilterTransactionCheckbox> {
  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(financialFilterProvider.notifier);
    final filterState = ref.watch(financialFilterProvider);

    return Column(
      children: [
        Text(
          'financial.transactionType'.tr(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: filterState.isAddition,
                  onChanged: (bool? value) {
                    if (value != null) {
                      filter.setIsAddition(value);
                    }
                  },
                ),
                const Text('financial.filter.walletAddition').tr(),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: filterState.isDeduction,
                  onChanged: (bool? value) {
                    if (value != null) {
                      filter.setIsDeduction(value);
                    }
                  },
                ),
                const Text('financial.filter.walletDeduction').tr(),
              ],
            ),
          ],
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
