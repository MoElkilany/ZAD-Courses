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
import '../../../domain/entities/academic_ticket.dart';

class TicketsListAcademic extends ConsumerStatefulWidget {
  const TicketsListAcademic({
    super.key,
    required this.height,
    required this.width,
    required this.ticketList,
  });

  final double height;
  final double width;
  final List<AcademicTicket> ticketList;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TicketsListAcademicState();
}

class _TicketsListAcademicState extends ConsumerState<TicketsListAcademic> {
  @override
  Widget build(BuildContext context) {
    final double height = widget.height;
    final double width = widget.width;
    final List<AcademicTicket> ticketListPrePaging = widget.ticketList;
    final ticketList = ref.read(pageManagerProvider.notifier).getPagedList(ticketListPrePaging) as List<AcademicTicket>;
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
                                    Container(
                                      width: width * 0.1,
                                      height: width * 0.1,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kSecondary.withOpacity(0.3),
                                      ),
                                      child: Stack(
                                        children: [
                                          if (ticketList[index].contactPhoto == '')
                                            const Center(
                                              child: Icon(
                                                Icons.person,
                                                color: kSecondary,
                                              ),
                                            ),
                                          //if there is a photo show it above the icon
                                          if (ticketList[index].contactPhoto != '')
                                            Center(
                                              child: FittedBox(
                                                fit: BoxFit.cover,
                                                child: Padding(
                                                  padding: appPaddingAll16,
                                                  child: CircleAvatar(
                                                    backgroundColor: kWhite,
                                                    radius: width,
                                                    backgroundImage: NetworkImage(
                                                      ticketList[index].contactPhoto,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    appBoxW4,
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            ticketList[index].contactName,
                                            style: const TextStyle(
                                              color: kDark,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxFontSize: appMaxTitleFontSize,
                                            minFontSize: appMinTitleFontSize,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          AutoSizeText(
                                            ticketList[index].contactRole,
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
                                      if (ticketList[index].createdAt != null)
                                        AutoSizeText(
                                          DateFormat('dd MMM yyyy | hh:mm').format(
                                            ticketList[index].createdAt!,
                                          ),
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
                              ),
                              Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: AutoSizeText(
                                  ticketList[index].status == 'replied'
                                      ? 'support.statusReplied'.tr()
                                      : ticketList[index].status == "close"
                                          ? 'support.statusClosed'.tr()
                                          : 'support.statusOpen'.tr(),
                                  maxFontSize: 12,
                                  minFontSize: 12,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ticketList[index].status == 'replied'
                                        ? kGreen
                                        : ticketList[index].status == "close"
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
