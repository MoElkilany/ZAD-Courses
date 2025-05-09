import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_shadow.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../../../common/presentation/providers/pagination.dart';
import '../../../../common/presentation/widgets/paginator.dart';
import '../../../domain/entities/platform_ticket.dart';

class TicketsListPlatform extends ConsumerStatefulWidget {
  const TicketsListPlatform({
    super.key,
    required this.height,
    required this.width,
    required this.ticketList,
  });

  final double height;
  final double width;
  final List<PlatformTicket> ticketList;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TicketsListPlatformState();
}

class _TicketsListPlatformState extends ConsumerState<TicketsListPlatform> {
  @override
  Widget build(BuildContext context) {
    final double height = widget.height;

    final List<PlatformTicket> ticketListPrePaging = widget.ticketList;
    final ticketList = ref.read(pageManagerProvider.notifier).getPagedList(ticketListPrePaging) as List<PlatformTicket>;
    return Column(
      children: [
        Padding(
          padding: appPaddingSymH8,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: ticketList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: appPaddingB8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: kWhite,
                      boxShadow: appShadowKgrey05,
                      borderRadius: index == 0 ? appBordRadBLR8 : appBordRadCir8,
                    ),
                    height: height * 0.1,
                    child: Material(
                      color: Colors.transparent,
                      child: Ink(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              appBoxW8,
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            ticketList[index].title,
                                            style: const TextStyle(
                                              color: kDark,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxFontSize: appMaxTitleFontSize,
                                            minFontSize: appMinTitleFontSize,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          if (ticketList[index].updatedAt != null)
                                            AutoSizeText(
                                              DateFormat('dd MMM yyyy | hh:mm').format(ticketList[index].updatedAt!),
                                              style: TextStyle(
                                                color: kDark.withOpacity(0.5),
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxFontSize: appMaxSubTitleFontSize,
                                              minFontSize: appMinSubTitleFontSize,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                        ],
                                      ),
                                    ),
                                    appBoxW4,
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: appPaddingDirecE4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        ticketList[index].department,
                                        style: const TextStyle(
                                          color: kDark,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxFontSize: appMaxTitleFontSize,
                                        minFontSize: appMinTitleFontSize,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: AutoSizeText(
                                  ticketList[index].status == 'replied'
                                      ? 'support.statusReplied'.tr()
                                      : ticketList[index].status == 'close'
                                          ? 'support.statusClosed'.tr()
                                          : 'support.statusOpen'.tr(),
                                  maxFontSize: 12,
                                  minFontSize: 12,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ticketList[index].status == 'replied'
                                        ? kGreen
                                        : ticketList[index].status == 'close'
                                            ? kRed
                                            : kWarning,
                                  ),
                                ),
                              ),
                              appBoxW8,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
        Paginator(
          numberPages: ref.watch(pageManagerProvider.notifier).getPagesCount(ticketListPrePaging),
          onPageChange: (int index) {
            ref.read(pageManagerProvider.notifier).setPage(index + 1);
            setState(() {});
          },
        ),
      ],
    );
  }
}
