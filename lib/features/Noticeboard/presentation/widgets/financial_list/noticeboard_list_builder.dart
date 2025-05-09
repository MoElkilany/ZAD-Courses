import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/colors.dart';
import '../../../domain/entities/notice.dart';
import '../../providers/noticeboard_lists_manager.dart';
import 'noticeboard_expansion_children.dart';
import 'noticeboard_expansion_title.dart';
import '../../../../common/presentation/providers/pagination.dart';

class NoticeboardListBuilder extends StatelessWidget {
  const NoticeboardListBuilder({
    super.key,
    required this.manager,
    required this.width,
    required this.height,
    required this.ref,
  });

  final NoticeboardListManager manager;
  final double width;
  final double height;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final noticeList = ref.watch(pageManagerProvider.notifier).getPagedList(manager.filteredNotices) as List<Notice>;
    return Flexible(
      fit: FlexFit.loose,
      child: Consumer(builder: (context, watch, child) {
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: noticeList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            Notice notice = noticeList[index];

            return Padding(
              padding: appPaddingB8,
              child: ExpansionTile(
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: index == 0 ? appBordRadBLR8 : appBordRadCir8,
                ),
                shape: index == 0
                    ? const RoundedRectangleBorder(
                        borderRadius: appBordRadBLR8,
                      )
                    : const RoundedRectangleBorder(
                        borderRadius: appBordRadCir8,
                      ),
                backgroundColor: kGray.withOpacity(0.15),
                collapsedBackgroundColor: kGray.withOpacity(0.15),
                iconColor: kGray,
                collapsedIconColor: kGray,
                controlAffinity: ListTileControlAffinity.leading,
                trailing: null,
                title: NoticeboardExpansionTitle(notice: notice),
                children: getNoticeboardExpansionTileChildren(
                  width,
                  height,
                  notice,
                  ref,
                  context,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
