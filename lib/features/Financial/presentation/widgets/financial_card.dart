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

class FinancialCard extends StatelessWidget {
  const FinancialCard({
    super.key,
    required this.finType,
    required this.num,
  });

  final FinancialCardType finType;
  final double num;

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
                    color: finType == FinancialCardType.balance
                        ? kZadBlue.withOpacity(0.25)
                        : finType == FinancialCardType.rechargeNum
                            ? kGreen.withOpacity(0.25)
                            : finType == FinancialCardType.enrolledNum
                                ? kRed.withOpacity(0.25)
                                : kYellow.withOpacity(0.25),
                    borderRadius: appBordRadCir8,
                  ),
                  child: Padding(
                    padding: appPaddingAll4,
                    child: Icon(
                      Icons.assignment_outlined,
                      size: isLandscape ? height * 0.0725 : height * 0.045,
                      color: finType == FinancialCardType.balance
                          ? kZadBlue
                          : finType == FinancialCardType.rechargeNum
                              ? kGreen
                              : finType == FinancialCardType.enrolledNum
                                  ? kRed
                                  : kYellow,
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
                      '${finType == FinancialCardType.balance ? num.toStringAsFixed(2) : num.toInt()}${finType == FinancialCardType.balance ? ' ${'financial.egp'.tr()}' : ''}',
                      style: TextStyle(
                        fontSize: appFontSizeMedium,
                        fontWeight: FontWeight.bold,
                        color: finType == FinancialCardType.balance
                            ? kZadBlue
                            : finType == FinancialCardType.rechargeNum
                                ? kGreen
                                : finType == FinancialCardType.enrolledNum
                                    ? kRed
                                    : kYellow,
                      ),
                    ),
                    FittedBox(
                      child: AutoSizeText(
                        finType == FinancialCardType.balance
                            ? 'financial.cards.walletBalance'.tr()
                            : finType == FinancialCardType.rechargeNum
                                ? 'financial.cards.rechargeTransactions'.tr()
                                : finType == FinancialCardType.enrolledNum
                                    ? 'financial.cards.enrolledCourses'.tr()
                                    : 'financial.cards.totalInstalments'.tr(),
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
