import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/config/app_font_size.dart';
import '../../../../../../core/config/app_sized_box.dart';
import '../../../../../../core/config/colors.dart';
import '../../../../domain/entities/student_assignment.dart';
import '../../../providers/assignment_details.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../main.dart';

List<Widget> getExpansionTileChildren(
  double width,
  double height,
  StudentAssignment asg,
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
                  'assignments.firstSubmission'.tr(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: kSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
                AutoSizeText(
                  asg.firstSubmission == null ? '-' : DateFormat('dd MMM yyyy | h:mm a').format(asg.firstSubmission!),
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
                  'assignments.lastSubmission'.tr(),
                  style: const TextStyle(
                    color: kDark,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                AutoSizeText(
                  asg.lastSubmission == null ? '-' : DateFormat('dd MMM yyyy | h:mm a').format(asg.lastSubmission!),
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
    Row(
      children: [
        appSizeBoxW15,
        if (asg.deadline != null)
          Flexible(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'assignments.deadline'.tr(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: kSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    DateFormat('dd MMM yyyy | h:mm a').format(asg.deadline!),
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
                  'assignments.attempts'.tr(),
                  style: const TextStyle(
                    color: kDark,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                AutoSizeText(
                  '${asg.attempts} / ${asg.maxAttempts}',
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
                  '${'assignments.grade'.tr()} (${asg.maxGrade})',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: kSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
                AutoSizeText(
                  '${asg.grade ?? '-'} / ${asg.minGrade}',
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
                  'assignments.status'.tr(),
                  style: const TextStyle(
                    color: kDark,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                AutoSizeText(
                  asg.status == "passed"
                      ? 'assignments.passed'.tr()
                      : asg.status == "pending"
                          ? 'assignments.submitted'.tr()
                          : asg.status == "not_submitted"
                              ? asg.deadline?.isAfter(DateTime.now()) ?? false
                                  ? 'assignments.notSubmitted'.tr()
                                  : 'assignments.missing'.tr()
                              : "assignments.failed".tr(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: asg.status == "passed"
                        ? kGreen
                        : asg.status == "pending"
                            ? kPrimary
                            : asg.status == "not_submitted"
                                ? kRed
                                : kWarning,
                  ),
                  maxLines: 1,
                  maxFontSize: appMaxSubTitleFontSize,
                  minFontSize: appMinSubTitleFontSize,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: width * 0.15,
          child: IconButton(
            onPressed: () {
              ref.read(studentAssignmentDetailsProvider.notifier).setAssignment(asg);
              context.push('/assignmentDetailsStudent');
            },
            icon: const Icon(
              Icons.remove_red_eye_outlined,
              color: kSecondary,
            ),
          ),
        ),
      ],
    ),
    appSizeBoxH01,
  ];

  var studentExpansionTileDesktop = [
    SizedBox(
      width: width,
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          const SizedBox(
            width: 50,
          ),
          SizedBox(
            width: width * 0.16,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'assignments.firstSubmission'.tr(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: kSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    asg.firstSubmission == null ? '-' : DateFormat('dd MMM yyyy | h:mm a').format(asg.firstSubmission!),
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
          SizedBox(
            width: width * 0.16,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'assignments.lastSubmission'.tr(),
                    style: const TextStyle(
                      color: kDark,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    asg.lastSubmission == null ? '-' : DateFormat('dd MMM yyyy | h:mm a').format(asg.lastSubmission!),
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
          if (asg.deadline != null)
            SizedBox(
              width: width * 0.16,
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'assignments.deadline'.tr(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: kSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      DateFormat('dd MMM | h:mm').format(asg.deadline!),
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
          SizedBox(
            width: width * 0.12,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'assignments.attempts'.tr(),
                    style: const TextStyle(
                      color: kDark,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    '${asg.attempts} / ${asg.maxAttempts}',
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
          SizedBox(
            width: width * 0.12,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    '${'assignments.grade'.tr()} (${asg.maxGrade})',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: kSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    '${asg.grade ?? '-'} / ${asg.minGrade}',
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
          SizedBox(
            width: width * 0.12,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'assignments.status'.tr(),
                    style: const TextStyle(
                      color: kDark,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    asg.status == "passed"
                        ? 'assignments.passed'.tr()
                        : asg.status == "pending"
                            ? 'assignments.submitted'.tr()
                            : asg.status == "not_submitted"
                                ? asg.deadline?.isAfter(DateTime.now()) ?? false
                                    ? 'assignments.notSubmitted'.tr()
                                    : 'assignments.missing'.tr()
                                : "assignments.failed".tr(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: asg.status == "passed"
                          ? kGreen
                          : asg.status == "pending"
                              ? kPrimary
                              : asg.status == "not_submitted"
                                  ? kRed
                                  : kWarning,
                    ),
                    maxLines: 1,
                    maxFontSize: appMaxSubTitleFontSize,
                    minFontSize: appMinSubTitleFontSize,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              ref.read(studentAssignmentDetailsProvider.notifier).setAssignment(asg);
              context.push('/assignmentDetailsStudent');
            },
            splashRadius: 15,
            icon: const Icon(
              Icons.remove_red_eye_outlined,
              color: kSecondary,
            ),
          ),
        ],
      ),
    ),
  ];
  return isLandscape ? studentExpansionTileDesktop : studentExpansionTileMobile;
}
