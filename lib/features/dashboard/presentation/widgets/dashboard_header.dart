import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/app_border.dart';
import '../../../../core/config/app_font_size.dart';
import '../../../../core/config/app_padding.dart';
import '../../../../core/config/app_sized_box.dart';
import '../../../../core/config/colors.dart';
import '../../../app_parent/presentation/providers/app_parent_states.dart';

class DashboardHeader extends ConsumerWidget {
  const DashboardHeader({
    super.key,
    required this.availableBalance,
    required this.withdrawableBalance,
    required this.currency,
  });

  final double availableBalance;
  final double withdrawableBalance;
  final String currency;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final isTeacher = ref.watch(AppParentStates.appUserInfo)!.isTeacher();

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'dashboard.dashboard'.tr(),
            style: const TextStyle(
              fontSize: appFontSizeVeryLarge,
              fontWeight: FontWeight.bold,
            ),
          ),
          appSizeBoxH01,
          Container(
            height: height * 0.2,
            width: width,
            decoration: const BoxDecoration(
              color: kBlue,
              borderRadius: appBordRadCir8,
            ),
            child: Padding(
              padding: appPaddingDirecS16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appSizeBoxH02,
                  AutoSizeText(
                    'dashboard.accountBalance'.tr(),
                    style: const TextStyle(
                      fontSize: appFontSizeMedium,
                      fontWeight: FontWeight.bold,
                      color: kWhite,
                    ),
                  ),
                  const Spacer(),
                  AutoSizeText(
                    '${availableBalance.toStringAsFixed(2)}\t\t$currency',
                    style: const TextStyle(
                      fontSize: appFontSizeHuge,
                      fontWeight: FontWeight.bold,
                      color: kWhite,
                    ),
                  ),
                  appSizeBoxH02,
                  const Padding(
                    padding: appPaddingDirecE16,
                    child: Divider(
                      color: kWhite,
                      thickness: 1,
                    ),
                  ),
                  if (isTeacher)
                    Column(
                      children: [
                        Padding(
                          padding: appPaddingDirecE16,
                          child: Row(
                            children: [
                              AutoSizeText(
                                'dashboard.withdrawable'.tr(),
                                style: const TextStyle(
                                  fontSize: appFontSizeMedium,
                                  fontWeight: FontWeight.bold,
                                  color: kWhite,
                                ),
                              ),
                              const Spacer(),
                              AutoSizeText(
                                '${withdrawableBalance.toStringAsFixed(2)}\t\t$currency',
                                style: const TextStyle(
                                  fontSize: appFontSizeMedium,
                                  fontWeight: FontWeight.bold,
                                  color: kWhite,
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  appSizeBoxH02,
                ],
              ),
            ),
          ),
          appSizeBoxH02,
        ],
      ),
    );
  }
}
