import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/config/app_border.dart';
import '../../../../core/config/app_font_size.dart';
import '../../../../core/config/app_padding.dart';
import '../../../../core/config/app_shadow.dart';
import '../../../../core/config/app_sized_box.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/types/app_types.dart';
import '../../../../main.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
    super.key,
    required this.ticketStatus,
    required this.numTickets,
  });

  final TicketStatus ticketStatus;
  final int numTickets;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * (isLandscape ? 1.25 : 1);
    final double width = MediaQuery.of(context).size.width / (isLandscape ? 3.25 : 1);

    var colorOpacity = ticketStatus == TicketStatus.total
        ? kBlue.withOpacity(0.2)
        : ticketStatus == TicketStatus.pending
            ? kOrange.withOpacity(0.2)
            : kRed.withOpacity(0.2);
    var color = ticketStatus == TicketStatus.total
        ? kBlue
        : ticketStatus == TicketStatus.pending
            ? kOrange
            : kRed;
    var text = ticketStatus == TicketStatus.total
        ? 'support.total'.tr()
        : ticketStatus == TicketStatus.pending
            ? 'support.pending'.tr()
            : 'support.closed'.tr();
    return Align(
      child: Container(
        height: height * 0.1,
        width: width * 0.92,
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: appBordRadCir8,
          boxShadow: appShadowKDark02,
        ),
        child: Padding(
          padding: appPaddingAll8,
          child: Row(
            children: [
              Container(
                width: width * 0.2,
                height: height,
                decoration: BoxDecoration(
                  color: colorOpacity,
                  borderRadius: appBordRadCir8,
                ),
                child: Icon(
                  Icons.chat_bubble_outline_rounded,
                  color: color,
                  size: height * 0.06,
                ),
              ),
              appSizeBoxW05,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      numTickets.toString(),
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: appFontSizeVeryLarge,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    AutoSizeText(
                      text,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: appFontSizeLarge,
                        color: kGray.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
