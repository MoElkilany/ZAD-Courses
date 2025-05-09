import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/config/app_border.dart';
import '../../../../core/config/app_font_size.dart';
import '../../../../core/config/app_padding.dart';
import '../../../../core/config/app_shadow.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/types/app_types.dart';
import '../../domain/usecases/get_card_styling.dart';
import '../../../../main.dart';

class AssignmentsCard extends StatelessWidget {
  const AssignmentsCard({
    super.key,
    required this.asgStatType,
    required this.num,
    this.active,
    this.expired,
  });

  final AsgStatType asgStatType;
  final int num;
  final int? active;
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
        width: width * 0.48,
        height: isLandscape ? height * 0.15 : height * 0.1,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: appPaddingAll8,
                child: Container(
                  decoration: BoxDecoration(
                    color: GetCardStyling.statusColorOpacity(asgStatType),
                    borderRadius: appBordRadCir8,
                  ),
                  child: Padding(
                    padding: appPaddingAll4,
                    child: Icon(
                      Icons.assignment_outlined,
                      size: isLandscape ? height * 0.0725 : height * 0.045,
                      color: GetCardStyling.statusColor(asgStatType),
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
                        color: GetCardStyling.statusColor(asgStatType),
                      ),
                    ),
                    FittedBox(
                      child: AutoSizeText(
                        GetCardStyling.statusString(asgStatType),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kGray,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    if (active != null && expired != null)
                      Flexible(
                        child: Row(
                          children: [
                            Flexible(
                              child: FittedBox(
                                child: AutoSizeText(
                                  '$active ',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kGreen,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: FittedBox(
                                child: AutoSizeText(
                                  'assignments.active'.tr(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kGray,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            const Flexible(
                              child: FittedBox(
                                child: AutoSizeText(
                                  ' | ',
                                  style: TextStyle(
                                    color: kGray,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            Flexible(
                              child: FittedBox(
                                child: AutoSizeText(
                                  '$expired ',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kRed,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: FittedBox(
                                child: AutoSizeText(
                                  'assignments.expired'.tr(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kGray,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ],
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
