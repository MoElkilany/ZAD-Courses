import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../providers/platformProviders/platform_filter.dart';

class PlatformFilterSubmissionRange extends ConsumerStatefulWidget {
  const PlatformFilterSubmissionRange({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlatformFilterSubmissionRangeState();
}

class _PlatformFilterSubmissionRangeState extends ConsumerState<PlatformFilterSubmissionRange> {
  @override
  Widget build(BuildContext context) {
    // final filter = ref.watch(studentAssignmentsFilterProvider.notifier);
    // final filterState = ref.watch(studentAssignmentsFilterProvider);
    final filter = ref.watch(platformFilterProvider.notifier);
    final filterState = ref.watch(platformFilterProvider);

    return Column(
      children: [
        Text(
          'support.submissionRange'.tr(),
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

                  // Do something with the picked date
                  filter.setFirstSubmission(picked);
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
                        filterState.firstSubmission == null
                            ? 'support.firstSubmission'.tr()
                            : DateFormat.yMMMd().format(filterState.firstSubmission!),
                        // DateFormat.yMMMd().format(DateTime.now()),
                        style: const TextStyle(
                          fontSize: appFontSizeLarge,
                        ),
                      ),
                      const Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              appBoxH8,
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

                  // Do something with the picked date
                  filter.setLastSubmission(picked);
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
                        filterState.lastSubmission == null ? 'support.lastSubmission'.tr() : DateFormat.yMMMd().format(filterState.lastSubmission!),
                        // DateFormat.yMMMd().format(DateTime.now()),
                        style: const TextStyle(
                          fontSize: appFontSizeLarge,
                        ),
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
