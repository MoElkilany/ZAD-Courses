import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/colors.dart';
import '../../../domain/entities/financial_document.dart';
import '../../../../../main.dart';

class FinancialExpansionTitle extends StatelessWidget {
  const FinancialExpansionTitle({
    super.key,
    required this.doc,
  });

  final FinDoc doc;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    doc.title,
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
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    doc.course,
                    style: const TextStyle(
                      color: kBlue,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
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
                  (doc.amount > 0)
                      ? '+${doc.amount}'
                      : (doc.amount < 0)
                          ? '${doc.amount}'
                          : '0',
                  // ? 'assignments.passed'.tr()
                  // : asg.status == "pending"
                  //     ? 'assignments.pending'.tr()
                  //     : asg.status == "not_submitted"
                  //         ? 'assignments.notSubmitted'.tr()
                  //         : "assignments.failed".tr(),
                  style: TextStyle(
                    color: (doc.amount > 0)
                        ? kGreen
                        : (doc.amount < 0)
                            ? kRed
                            : kBlue,
                    // : asg.status == "pending"
                    //     ? kYellow
                    //     : asg.status == "not_submitted"
                    //         ? kBlue
                    // fontWeight: FontWeight.bold,
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
