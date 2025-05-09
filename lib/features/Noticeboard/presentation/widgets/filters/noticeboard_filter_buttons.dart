import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../providers/noticeboard_filter.dart';
import '../../providers/noticeboard_lists_manager.dart';
import '../../../../../router/router_utils.dart';

class NoticeboardFilterButtons extends ConsumerStatefulWidget {
  const NoticeboardFilterButtons({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NoticeboardFilterButtonsState();
}

class _NoticeboardFilterButtonsState extends ConsumerState<NoticeboardFilterButtons> {
  @override
  Widget build(BuildContext context) {
    final manager = ref.watch(noticeboardListManagerProvider.notifier);
    final filter = ref.watch(noticeboardFilterProvider.notifier);

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
                  manager.setFilteredNotices();
                  Navigator.pop(context);
                  GoRouter.of(context).pushReplacement(AppPages.noticeboard.toPath);

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
                  manager.resetSelectedCourse();
                  manager.resetFilteredNotices();
                  Navigator.pop(context);
                  GoRouter.of(context).pushReplacement(AppPages.noticeboard.toPath);
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
