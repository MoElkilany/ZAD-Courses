import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../config/app_font_size.dart';
import '../../config/app_size.dart';
import '../../config/app_sized_box.dart';
import '../../config/colors.dart';
import '../../../main.dart';

class ErrorPage extends StatelessWidget {
  final String errorMessage;
  final double? height;
  final double? width;
  final bool showRefresh;
  final Function? onDesktopRefresh;

  const ErrorPage({
    super.key,
    required this.errorMessage,
    this.height,
    this.width,
    this.showRefresh = true,
    this.onDesktopRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? AppSize.height * 0.85,
      width: width ?? AppSize.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appSizeBoxH02,
            Flexible(
              child: Image.asset(
                'assets/no_content.png',
                height: AppSize.width * 0.5,
                width: AppSize.width * 0.5,
              ),
            ),
            appSizeBoxH02,
            Text(
              errorMessage,
              style: const TextStyle(
                fontSize: appFontSizeVeryLarge,
              ),
            ),
            appSizeBoxH01,
            if (showRefresh && !isLandscape)
              Text(
                'errors.pullToRefresh'.tr(),
                style: const TextStyle(
                  fontSize: appFontSizeMedium,
                  color: kGray,
                ),
              ),
            if (showRefresh && isLandscape)
              TextButton(
                onPressed: () {
                  if (onDesktopRefresh != null) {
                    onDesktopRefresh!();
                  }
                },
                child: Text(
                  'errors.pressToRefresh'.tr(),
                  style: const TextStyle(
                    fontSize: appFontSizeMedium,
                    color: kGray,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
