import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/config/app_font_size.dart';
import '../../../../core/config/app_padding.dart';
import '../../../../core/config/app_sized_box.dart';
import 'tab_bars.dart';

class LearningBody extends StatelessWidget {
  const LearningBody({super.key});

  // final Widget player;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: appPaddingTLR8,
      child: DefaultTabController(
        length: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const BackButton(),
                Text(
                  'courses.learningPage'.tr(),
                  style: const TextStyle(
                    fontSize: appFontSizeVeryLarge,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            appSizeBoxH01,
            tabBar,
            appSizeBoxH01,
            const Expanded(
              child: tabBarViews,
            ),
          ],
        ),
      ),
    );
  }
}
