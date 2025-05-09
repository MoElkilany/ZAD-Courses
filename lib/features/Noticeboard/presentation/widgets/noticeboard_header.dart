import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/app_font_size.dart';
import '../../../../core/config/app_sized_box.dart';
import '../../domain/entities/noticeboard_data_student.dart';
import '../../domain/entities/noticeboard_data_teacher.dart';
import 'noticeboard_stat_grid.dart';

class NoticeboardHeader extends ConsumerWidget {
  const NoticeboardHeader({super.key, this.dataTeacher, this.dataStudent});

  final NoticeboardDataTeacher? dataTeacher;
  final NoticeboardDataStudent? dataStudent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;

    final data = dataTeacher ?? dataStudent;

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'noticeboard.noticeboard'.tr(),
            style: const TextStyle(
              fontSize: appFontSizeVeryLarge,
              fontWeight: FontWeight.bold,
            ),
          ),
          appSizeBoxH01,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NoticeboardStatGrid(
                data: data,
              ),
              appSizeBoxH01,
              AutoSizeText(
                'noticeboard.notices'.tr(),
                style: const TextStyle(
                  fontSize: appFontSizeVeryLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
              appSizeBoxH01,
            ],
          )
        ],
      ),
    );
  }
}
