import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../main.dart';
import '../../../domain/entities/financial_document.dart';

List<Widget> getFinancialExpansionTileChildren(
  double width,
  double height,
  FinDoc doc,
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
                  'financial.createdDate'.tr(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: kSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
                AutoSizeText(
                  DateFormat('dd MMM yyyy | h:mm a').format(doc.createdAt),
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
                  'financial.description'.tr(),
                  style: const TextStyle(
                    color: kDark,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                AutoSizeText(
                  doc.description,
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
        children: [
          const SizedBox(
            width: 50,
          ),
          Flexible(
            // width: width * 0.16,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'financial.createdDate'.tr(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: kSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    DateFormat('dd MMM yyyy | h:mm a').format(doc.createdAt),
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
            child: SizedBox(
              width: width * 0.4,
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'financial.description'.tr(),
                      style: const TextStyle(
                        color: kDark,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      doc.description,
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
