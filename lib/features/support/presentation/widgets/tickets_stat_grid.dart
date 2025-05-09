import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/config/app_font_size.dart';
import '../../../../core/config/app_padding.dart';
import '../../../../core/config/app_sized_box.dart';
import '../../../../core/types/app_types.dart';
import 'ticket_card.dart';
import '../../../../main.dart';

class TicketsStatGrid extends StatelessWidget {
  const TicketsStatGrid({
    super.key,
    required this.totalNum,
    required this.pendingNum,
    required this.closedNum,
    required this.supportType,
  });

  final int totalNum;
  final int pendingNum;
  final int closedNum;
  final String supportType;

  @override
  Widget build(BuildContext context) {
    final String type = supportType == 'academic' ? 'support.academic'.tr() : 'support.platform'.tr();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: appPaddingDirecS8,
          child: AutoSizeText(
            type,
            style: const TextStyle(
              fontSize: appFontSizeVeryLarge,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        appBoxH8,
        Flex(
          direction: isLandscape ? Axis.horizontal : Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TicketCard(
              numTickets: totalNum,
              ticketStatus: TicketStatus.total,
            ),
            isLandscape ? appBoxW16 : appBoxH8,
            TicketCard(
              numTickets: pendingNum,
              ticketStatus: TicketStatus.pending,
            ),
            isLandscape ? appBoxW16 : appBoxH8,
            TicketCard(
              numTickets: closedNum,
              ticketStatus: TicketStatus.closed,
            ),
            isLandscape ? appBoxW16 : appBoxH20,
          ],
        ),
      ],
    );
  }
}
