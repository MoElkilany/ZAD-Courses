import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../providers/evaluation_provider.dart';
import '../../providers/evaluations_filter.dart';

class EvaluationsFilterCourseDropDown extends ConsumerWidget {
  const EvaluationsFilterCourseDropDown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseFilterNotifier = ref.read(evaluationsCourseFilterProvider.notifier);
    final courses = ref.watch(evaluationsDataProvider);
    final courseFilter = ref.watch(evaluationsCourseFilterProvider);

    return Column(
      children: [
        Text(
          'noticeboard.course'.tr(),
          style: const TextStyle(
            fontSize: appFontSizeLarge,
            fontWeight: FontWeight.bold,
          ),
        ),
        courses.when(
          data: (d) => d.fold(
              (l) => TextField(
                    enabled: false,
                    controller: TextEditingController(text: 'Error'),
                  ),
              (r) => Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        value: courseFilter,
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
                        onChanged: (int? newValue) {
                          courseFilterNotifier.update((_) => newValue);
                        },
                        items: r.courses
                            .map(
                              (c) => DropdownMenuItem(
                                value: c.id,
                                child: Text(c.name),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  )),
          error: (_, __) => TextField(
            enabled: false,
            controller: TextEditingController(text: 'Error'),
          ),
          loading: () => TextField(
            enabled: false,
            controller: TextEditingController(text: 'Loading'),
          ),
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
