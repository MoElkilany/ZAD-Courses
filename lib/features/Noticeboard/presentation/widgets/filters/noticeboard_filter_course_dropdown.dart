import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../providers/noticeboard_lists_manager.dart';
import '../../../../../core/config/app_border.dart';

class NoticeboardFilterCourseDropDown extends ConsumerStatefulWidget {
  const NoticeboardFilterCourseDropDown({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NoticeboardFilterCourseDropDownState();
}

class _NoticeboardFilterCourseDropDownState extends ConsumerState<NoticeboardFilterCourseDropDown> {
  @override
  Widget build(BuildContext context) {
    final manager = ref.watch(noticeboardListManagerProvider.notifier);

    return Column(
      children: [
        Text(
          'noticeboard.course'.tr(),
          style: const TextStyle(
            fontSize: appFontSizeLarge,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<String>(
          value: manager.selectedCourse,
          isExpanded: true,
          icon: const Padding(
            padding: appPaddingAll8,
            child: Icon(
              Icons.arrow_downward,
            ),
          ),
          iconSize: 14,
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: kPrimary,
          ),
          hint: Text('noticeboard.filter.selectCourse'.tr()),
          disabledHint: Text('noticeboard.filter.selectCourse'.tr()),
          borderRadius: appBordRadCir8,
          onChanged: (String? newValue) {
            manager.setSelectedCoure(newValue);
            setState(() {});
          },
          items: manager.dropDownCourses,
        ),
        appSizeBoxH01,
        const Divider(
          thickness: 1,
        ),
        appSizeBoxH01,
      ],
    );
  }
}
