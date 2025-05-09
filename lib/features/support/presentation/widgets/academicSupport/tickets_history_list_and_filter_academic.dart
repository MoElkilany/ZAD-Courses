import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';
import 'academic_filter_collumn.dart';
import '../../../../../core/config/app_size.dart';
import '../../../../../main.dart';

class TicketsHistoryListAndFilterAcademic extends StatelessWidget {
  const TicketsHistoryListAndFilterAcademic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = AppSize.width;
    final height = AppSize.height;
    return Column(
      children: [
        Padding(
          padding: appPaddingDirecS8,
          child: Row(
            children: [
              isLandscape
                  ? Padding(
                      padding: appPaddingDirecS16,
                      child: AutoSizeText(
                        'support.ticketsHistory'.tr(),
                        style: const TextStyle(
                          fontSize: appFontSizeVeryLarge,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Expanded(
                      child: AutoSizeText(
                        'support.ticketsHistory'.tr(),
                        style: const TextStyle(
                          fontSize: appFontSizeVeryLarge,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              IconButton(
                onPressed: () {
                  showModalSideSheet(
                    barrierDismissible: true,
                    elevation: 10,
                    width: width * 0.7,
                    context: context,
                    ignoreAppBar: false,
                    body: const AcademicFilterCollumn(),
                  );
                },
                icon: const Icon(
                  Icons.filter_alt_outlined,
                  color: kSecondary,
                ),
              ),
              appBoxW8,
            ],
          ),
        ),
        appBoxH8,
        Padding(
          padding: appPaddingSymH8,
          child: Container(
            height: height * 0.06,
            decoration: const BoxDecoration(
              color: kSecondary,
              borderRadius: appBordRadTLR8,
            ),
            child: Row(
              children: [
                appBoxW8,
                Expanded(
                  child: AutoSizeText(
                    'support.contact'.tr(),
                    style: const TextStyle(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: AutoSizeText(
                    'support.title'.tr(),
                    style: const TextStyle(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: AutoSizeText(
                    'support.status'.tr(),
                    style: const TextStyle(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                appBoxW8,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
