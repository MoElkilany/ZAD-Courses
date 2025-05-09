import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';

import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_size.dart';

import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../../domain/entities/student/quiz_result.dart';

class QuizDetailsGridMobile extends StatelessWidget {
  const QuizDetailsGridMobile({
    super.key,
    required this.quiz,
  });

  final QuizResult quiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Padding(
          padding: appPaddingAll4,
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: SizedBox(
                height: 25,
                child: BackButton(
                  color: kWhite,
                ),
              ),
            ),
          ),
        ),
        appBoxH8,
        Row(
          children: [
            appBoxW8,
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300]!.withOpacity(0.15),
                          borderRadius: appBordRadCir50,
                        ),
                        padding: appPaddingAll8,
                        child: const Icon(Icons.star_outline, color: kWhite, size: 30),
                      ),
                      appBoxW8,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              quiz.status == "passed"
                                  ? 'quizzes.passed'.tr()
                                  : quiz.status == "waiting"
                                      ? 'quizzes.waiting'.tr()
                                      : "quizzes.failed".tr(),
                              style: TextStyle(
                                color: quiz.status == "passed"
                                    ? kGreen
                                    : quiz.status == "waiting"
                                        ? kYellow
                                        : kRed,
                              )),
                          Text('assignments.status'.tr(), style: const TextStyle(color: kWhite)),
                        ],
                      ),
                    ],
                  ),
                  appBoxH8,
                ],
              ),
            ),
            appBoxW8,
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300]!.withOpacity(0.15),
                          borderRadius: appBordRadCir50,
                        ),
                        padding: appPaddingAll8,
                        child: const Icon(Icons.assignment_outlined, color: kWhite, size: 30),
                      ),
                      appBoxW8,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${quiz.userAttempts ?? '-'}/${quiz.totalAttempts ?? '-'}', style: const TextStyle(color: kWhite)),
                          FittedBox(
                            child: AutoSizeText('assignments.attempts'.tr(), maxLines: 1, style: const TextStyle(color: kWhite)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  appBoxH8,
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            appBoxW8,
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300]!.withOpacity(0.15),
                          borderRadius: appBordRadCir50,
                        ),
                        padding: appPaddingAll8,
                        child: const Icon(Icons.calendar_today_outlined, color: kWhite, size: 30),
                      ),
                      appBoxW8,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${quiz.totalMark ?? '-'}/${quiz.maxMark ?? '-'}', style: const TextStyle(color: kWhite)),
                          Text('assignments.yourGrade'.tr(), style: const TextStyle(color: kWhite)),
                        ],
                      ),
                    ],
                  ),
                  appBoxH8,
                ],
              ),
            ),
            appBoxW8,
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300]!.withOpacity(0.15),
                          borderRadius: appBordRadCir50,
                        ),
                        padding: appPaddingAll8,
                        child: const Icon(Icons.calendar_today_outlined, color: kWhite, size: 30),
                      ),
                      appBoxW8,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${quiz.passMark ?? '-'}', style: const TextStyle(color: kWhite)),
                          Text('assignments.minGrade'.tr(), style: const TextStyle(color: kWhite)),
                        ],
                      ),
                    ],
                  ),
                  appBoxH8,
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class QuizDetailsGridDesktop extends StatelessWidget {
  const QuizDetailsGridDesktop({
    super.key,
    required this.quiz,
  });

  final QuizResult quiz;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: appPaddingAll4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Padding(
            padding: appPaddingAll4,
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: SizedBox(
                  height: 25,
                  child: BackButton(
                    color: kWhite,
                  ),
                ),
              ),
            ),
          ),
          appBoxH8,
          SizedBox(
            width: AppSize.width,
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              spacing: appFontSizeLarge,
              runSpacing: appFontSizeLarge,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300]!.withOpacity(0.15),
                              borderRadius: appBordRadCir50,
                            ),
                            padding: appPaddingAll8,
                            child: const Icon(Icons.star_outline, color: kWhite, size: 30),
                          ),
                          appBoxW8,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  quiz.status == "passed"
                                      ? 'quizzes.passed'.tr()
                                      : quiz.status == "waiting"
                                          ? 'quizzes.waiting'.tr()
                                          : "quizzes.failed".tr(),
                                  style: TextStyle(
                                    color: quiz.status == "passed"
                                        ? kGreen
                                        : quiz.status == "waiting"
                                            ? kYellow
                                            : kRed,
                                  )),
                              Text('assignments.status'.tr(), style: const TextStyle(color: kWhite)),
                            ],
                          ),
                        ],
                      ),
                      appBoxH8,
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300]!.withOpacity(0.15),
                              borderRadius: appBordRadCir50,
                            ),
                            padding: appPaddingAll8,
                            child: const Icon(Icons.assignment_outlined, color: kWhite, size: 30),
                          ),
                          appBoxW8,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${quiz.userAttempts ?? '-'}/${quiz.totalAttempts ?? '-'}', style: const TextStyle(color: kWhite)),
                              FittedBox(
                                child: AutoSizeText('assignments.attempts'.tr(), maxLines: 1, style: const TextStyle(color: kWhite)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      appBoxH8,
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300]!.withOpacity(0.15),
                              borderRadius: appBordRadCir50,
                            ),
                            padding: appPaddingAll8,
                            child: const Icon(Icons.calendar_today_outlined, color: kWhite, size: 30),
                          ),
                          appBoxW8,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${quiz.totalMark ?? '-'}/${quiz.maxMark ?? '-'}', style: const TextStyle(color: kWhite)),
                              Text('assignments.yourGrade'.tr(), style: const TextStyle(color: kWhite)),
                            ],
                          ),
                        ],
                      ),
                      appBoxH8,
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300]!.withOpacity(0.15),
                              borderRadius: appBordRadCir50,
                            ),
                            padding: appPaddingAll8,
                            child: const Icon(Icons.calendar_today_outlined, color: kWhite, size: 30),
                          ),
                          appBoxW8,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${quiz.passMark ?? '-'}', style: const TextStyle(color: kWhite)),
                              Text('assignments.minGrade'.tr(), style: const TextStyle(color: kWhite)),
                            ],
                          ),
                        ],
                      ),
                      appBoxH8,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
