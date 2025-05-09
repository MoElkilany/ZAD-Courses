import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../providers/academicProviders/academic_filter.dart';
import '../../../../../core/config/app_sized_box.dart';

class AcademicFilterStatusCheckbox extends ConsumerStatefulWidget {
  const AcademicFilterStatusCheckbox({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AcademicFilterStatusCheckboxState();
}

class _AcademicFilterStatusCheckboxState extends ConsumerState<AcademicFilterStatusCheckbox> {
  @override
  Widget build(BuildContext context) {
    // final filter = ref.watch(studentAssignmentsFilterProvider.notifier);
    // final filterState = ref.watch(studentAssignmentsFilterProvider);
    final academicFilter = ref.watch(academicFilterProvider.notifier);
    final academicFilterState = ref.watch(academicFilterProvider);

    return Column(
      children: [
        Text(
          'support.status'.tr(),
          style: const TextStyle(
            fontSize: appFontSizeLarge,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: academicFilterState.isReplied, //filterState.isPending,
                  onChanged: (bool? value) {
                    if (value != null) {
                      // filter.setPending(value);
                      academicFilter.setReplied(value);
                    }
                  },
                ),
                const Text('support.repliedFilter').tr(),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: academicFilterState.isOpen, //filterState.isPassed,
                  onChanged: (bool? value) {
                    if (value != null) {
                      // filter.setPassed(value);
                      academicFilter.setOpen(value);
                    }
                  },
                ),
                const Text('support.openFilter').tr(),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: academicFilterState.isClosed, // filterState.isFailed,
                  onChanged: (bool? value) {
                    if (value != null) {
                      // filter.setFailed(value);
                      academicFilter.setClosed(value);
                    }
                  },
                ),
                const Text('support.closedFilter').tr(),
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
