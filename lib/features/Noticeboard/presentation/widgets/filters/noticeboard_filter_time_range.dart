import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../providers/noticeboard_filter.dart';

class NoticeboardFilterSubmissionRange extends ConsumerStatefulWidget {
  const NoticeboardFilterSubmissionRange({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NoticeboardFilterSubmissionRangeState();
}

class _NoticeboardFilterSubmissionRangeState extends ConsumerState<NoticeboardFilterSubmissionRange> {
  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(noticeboardFilterProvider.notifier);
    final filterState = ref.watch(noticeboardFilterProvider);

    return Column(
      children: [
        Text(
          'noticeboard.timeRange'.tr(),
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
                        filterState.firstSubmission == null ? 'noticeboard.from'.tr() : DateFormat.yMMMd().format(filterState.firstSubmission!),
                        style: const TextStyle(fontSize: appFontSizeLarge),
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
                        filterState.lastSubmission == null ? 'noticeboard.to'.tr() : DateFormat.yMMMd().format(filterState.lastSubmission!),
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
