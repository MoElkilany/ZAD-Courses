import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../providers/platformProviders/platform_filter.dart';
import '../../providers/platformProviders/platform_manager.dart';

class PlatformFilterButtons extends ConsumerStatefulWidget {
  const PlatformFilterButtons({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlatformFilterButtonsState();
}

class _PlatformFilterButtonsState extends ConsumerState<PlatformFilterButtons> {
  @override
  Widget build(BuildContext context) {
    // final filter = ref.watch(studentAssignmentsFilterProvider.notifier);
    // final asgManager =
    //     ref.watch(studentAssignmentsListManagerProvider.notifier);
    final filter = ref.watch(platformFilterProvider.notifier);
    final platformManager = ref.watch(platformManagerProvider.notifier);

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
                  platformManager.setFilteredTickets();
                  Navigator.pop(context);
                  GoRouter.of(context).pushReplacement('/platformSupportHistory');
                },
                child: Text(
                  'support.show'.tr(),
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
                  platformManager.resetSelectedDepartments();
                  platformManager.resetFilteredTickets();
                  Navigator.pop(context);
                  GoRouter.of(context).pushReplacement('/platformSupportHistory');
                },
                child: Text(
                  'support.reset'.tr(),
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
