import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/config/app_font_size.dart';
import '../../../../../../core/config/colors.dart';
import '../../../../domain/entities/student_assignment.dart';
import '../../../../../../main.dart';

class ExpansionTileRowTitleStudent extends StatelessWidget {
  const ExpansionTileRowTitleStudent({
    super.key,
    required this.asg,
  });

  final StudentAssignment asg;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (asg.deadline != null)
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      asg.title,
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
            width: MediaQuery.of(context).size.width * 0.4,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    asg.courseName,
                    style: const TextStyle(
                      color: kBlue,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    asg.className,
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
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: SizedBox(
              height: isLandscape ? MediaQuery.of(context).size.height * 0.03 : null,
              child: FittedBox(
                child: AutoSizeText(
                  asg.status == "passed"
                      ? 'assignments.passed'.tr()
                      : asg.status == "pending"
                          ? 'assignments.submitted'.tr()
                          : asg.status == "not_submitted"
                              ? asg.deadline?.isAfter(DateTime.now()) ?? false
                                  ? 'assignments.notSubmitted'.tr()
                                  : 'assignments.missing'.tr()
                              : "assignments.failed".tr(),
                  style: TextStyle(
                    color: (asg.attempts != null && asg.attempts! > 0) ? kPrimary : kRed,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
