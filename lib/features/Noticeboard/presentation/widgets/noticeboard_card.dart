import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/config/app_border.dart';
import '../../../../core/config/app_font_size.dart';
import '../../../../core/config/app_padding.dart';
import '../../../../core/config/app_shadow.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/types/app_types.dart';
import '../../../../main.dart';

class NoticeboardCard extends StatelessWidget {
  const NoticeboardCard({
    super.key,
    required this.finType,
    required this.num,
  });

  final NoticeboardCardType finType;
  final int num;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 16;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(width * 0.04 / 4),
      child: Container(
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: appBordRadCir8,
          boxShadow: appShadowKDark02,
        ),
        width: width * 0.455,
        height: isLandscape ? height * 0.15 : height * 0.1,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: appPaddingAll8,
                child: Container(
                  decoration: BoxDecoration(
                    color: finType == NoticeboardCardType.total
                        ? kZadBlue.withOpacity(0.25)
                        : finType == NoticeboardCardType.course
                            ? kGreen.withOpacity(0.25)
                            : kRed.withOpacity(0.25),
                    borderRadius: appBordRadCir8,
                  ),
                  child: Padding(
                    padding: appPaddingAll4,
                    child: Icon(
                      Icons.assignment_outlined,
                      size: isLandscape ? height * 0.0725 : height * 0.045,
                      color: finType == NoticeboardCardType.total
                          ? kZadBlue
                          : finType == NoticeboardCardType.course
                              ? kGreen
                              : kRed,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: appPaddingR8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      num.toString(),
                      style: TextStyle(
                        fontSize: appFontSizeMedium,
                        fontWeight: FontWeight.bold,
                        color: finType == NoticeboardCardType.total
                            ? kZadBlue
                            : finType == NoticeboardCardType.course
                                ? kGreen
                                : kRed,
                      ),
                    ),
                    FittedBox(
                      child: AutoSizeText(
                        finType == NoticeboardCardType.total
                            ? 'noticeboard.totalNotices'.tr()
                            : finType == NoticeboardCardType.course
                                ? 'noticeboard.courseNotices'.tr()
                                : 'noticeboard.generalNotices'.tr(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kGray,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
