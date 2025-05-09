import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../providers/evaluations_filter.dart';

class EvaluationsFilterSubmissionRange extends ConsumerWidget {
  const EvaluationsFilterSubmissionRange({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(evaluationsDateFilterProvider);
    final dateNotifier = ref.watch(evaluationsDateFilterProvider.notifier);
    return Column(
      children: [
        Text(
          'evaluations.timeRange'.tr(),
          style: const TextStyle(
            fontSize: appFontSizeLarge,
            fontWeight: FontWeight.bold,
          ),
        ),
        appSizeBoxH01,
        Padding(
          padding: appPaddingDirecE8,
          child: Column(
            children: [
              InkWell(
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: kSecondary,
                            secondary: kSecondary,
                            surface: kSecondary,
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  dateNotifier.update((_) => picked);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: appBordRadCir4,
                  ),
                  padding: appPaddingAll8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        date == null ? 'Evaluations.from'.tr() : DateFormat.yMMMd().format(date),
                        style: const TextStyle(fontSize: appFontSizeLarge),
                      ),
                      const Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
