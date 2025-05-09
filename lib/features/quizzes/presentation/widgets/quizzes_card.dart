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

class QuizzesCard extends StatelessWidget {
  const QuizzesCard({
    super.key,
    required this.quizStatType,
    required this.num,
    this.expired,
  });

  final QuizStatType quizStatType;
  final int num;
  final int? expired;

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
        width: expired != null ? width * 0.88 : width * 0.48,
        height: isLandscape ? height * 0.15 : height * 0.1,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: appPaddingAll8,
                child: Container(
                  decoration: BoxDecoration(
                    color: quizStatType == QuizStatType.all
                        ? kZadBlue.withOpacity(0.25)
                        : quizStatType == QuizStatType.passed
                            ? kZadBrightGreen.withOpacity(0.25)
                            : quizStatType == QuizStatType.open
                                ? kYellow.withOpacity(0.25)
                                : kZadRed.withOpacity(0.25),
                    borderRadius: appBordRadCir8,
                  ),
                  child: Padding(
                    padding: appPaddingAll4,
                    child: Icon(
                      Icons.assignment_outlined,
                      size: expired != null ? height * 0.06 : height * 0.048,
                      color: quizStatType == QuizStatType.all
                          ? kZadBlue
                          : quizStatType == QuizStatType.passed
                              ? kZadBrightGreen
                              : quizStatType == QuizStatType.open
                                  ? kYellow
                                  : kZadRed,
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
                        fontSize: appFontSizeVeryLarge,
                        fontWeight: FontWeight.bold,
                        color: quizStatType == QuizStatType.all
                            ? kZadBlue
                            : quizStatType == QuizStatType.passed
                                ? kZadBrightGreen
                                : quizStatType == QuizStatType.open
                                    ? kYellow
                                    : kZadRed,
                      ),
                    ),
                    if (expired != null)
                      Row(
                        children: [
                          Text(
                            '${num - expired!}',
                            style: const TextStyle(
                              fontSize: appFontSizeCompact,
                              color: kZadBrightGreen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ' ${'assignments.active'.tr()} | ',
                            style: const TextStyle(
                              fontSize: appFontSizeCompact,
                            ),
                          ),
                          Text(
                            '${expired!}',
                            style: const TextStyle(
                              fontSize: appFontSizeCompact,
                              fontWeight: FontWeight.bold,
                              color: kZadRed,
                            ),
                          ),
                          Text(
                            ' ${'assignments.expired'.tr()}',
                            style: const TextStyle(
                              fontSize: appFontSizeCompact,
                            ),
                          ),
                        ],
                      ),
                    FittedBox(
                      child: AutoSizeText(
                        quizStatType == QuizStatType.all
                            ? 'quizzes.all'.tr()
                            : quizStatType == QuizStatType.passed
                                ? 'quizzes.passed'.tr()
                                : quizStatType == QuizStatType.open
                                    ? 'quizzes.openResults'.tr()
                                    : 'quizzes.failed'.tr(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: appFontSizeCompact,
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
