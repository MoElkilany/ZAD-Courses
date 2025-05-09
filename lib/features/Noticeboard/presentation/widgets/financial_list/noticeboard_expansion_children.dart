import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../../domain/entities/notice.dart';
import '../../../../../main.dart';

List<Widget> getNoticeboardExpansionTileChildren(
  double width,
  double height,
  Notice notice,
  WidgetRef ref,
  BuildContext context,
) {
  var studentExpansionTileMobile = [
    Row(
      children: [
        appSizeBoxW15,
        Flexible(
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  'noticeboard.type'.tr(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: kSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
                AutoSizeText(
                  notice.type,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kGray.withOpacity(0.6),
                  ),
                  maxLines: 1,
                  maxFontSize: appMaxSubTitleFontSize,
                  minFontSize: appMinSubTitleFontSize,
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  'noticeboard.createdBy'.tr(),
                  style: const TextStyle(
                    color: kDark,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                AutoSizeText(
                  notice.sender,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kGray.withOpacity(0.6),
                  ),
                  maxLines: 1,
                  maxFontSize: appMaxSubTitleFontSize,
                  minFontSize: appMinSubTitleFontSize,
                ),
              ],
            ),
          ),
        ),
        appSizeBoxW15,
      ],
    ),
    appSizeBoxH01,
  ];

  var studentExpansionTileDesktop = [
    SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 50,
          ),
          Flexible(
            child: SizedBox(
              // width: width * 0.16,
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'noticeboard.type'.tr(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: kSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      notice.type,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: kGray.withOpacity(0.6),
                      ),
                      maxLines: 1,
                      maxFontSize: appMaxSubTitleFontSize,
                      minFontSize: appMinSubTitleFontSize,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: SizedBox(
              width: width * 0.4,
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'noticeboard.createdBy'.tr(),
                      style: const TextStyle(
                        color: kDark,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      notice.sender,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: kGray.withOpacity(0.6),
                      ),
                      maxLines: 1,
                      maxFontSize: appMaxSubTitleFontSize,
                      minFontSize: appMinSubTitleFontSize,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: width * 0.135,
          ),
        ],
      ),
    ),
  ];
  return isLandscape ? studentExpansionTileDesktop : studentExpansionTileMobile;
}
