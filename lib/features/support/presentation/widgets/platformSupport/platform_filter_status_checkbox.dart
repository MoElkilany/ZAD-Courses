import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../providers/platformProviders/platform_filter.dart';
import '../../../../../core/config/app_sized_box.dart';

class PlatformFilterStatusCheckbox extends ConsumerStatefulWidget {
  const PlatformFilterStatusCheckbox({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlatformFilterStatusCheckboxState();
}

class _PlatformFilterStatusCheckboxState extends ConsumerState<PlatformFilterStatusCheckbox> {
  @override
  Widget build(BuildContext context) {
    // final filter = ref.watch(studentAssignmentsFilterProvider.notifier);
    // final filterState = ref.watch(studentAssignmentsFilterProvider);
    final filter = ref.watch(platformFilterProvider.notifier);
    final filterState = ref.watch(platformFilterProvider);

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
                  value: filterState.isReplied,
                  onChanged: (bool? value) {
                    if (value != null) {
                      filter.setReplied(value);
                    }
                  },
                ),
                const Text('support.repliedFilter').tr(),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: filterState.isOpen,
                  onChanged: (bool? value) {
                    if (value != null) {
                      filter.setOpen(value);
                    }
                  },
                ),
                const Text('support.openFilter').tr(),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: filterState.isClosed,
                  onChanged: (bool? value) {
                    if (value != null) {
                      filter.setClosed(value);
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
