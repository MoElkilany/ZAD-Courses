import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/app_sized_box.dart';
import '../../../../core/types/app_types.dart';
import 'noticeboard_card.dart';

class NoticeboardStatGrid extends ConsumerWidget {
  const NoticeboardStatGrid({super.key, required this.data});

  final dynamic data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            NoticeboardCard(
              finType: NoticeboardCardType.total,
              num: data.totalNoticeboards,
            ),
            NoticeboardCard(
              finType: NoticeboardCardType.course,
              num: data.totalCourseNotices,
            ),
          ],
        ),
        Row(
          children: [
            NoticeboardCard(
              finType: NoticeboardCardType.general,
              num: data.totalGeneralNoticies,
            ),
          ],
        ),
        appBoxH8,
      ],
    );
  }
}
