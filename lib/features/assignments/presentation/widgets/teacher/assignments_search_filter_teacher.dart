import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';
import '../../../../../core/config/app_size.dart';
import '../../providers/assignment_lists_manager_teacher.dart';
import '../../providers/assignments_filter.dart';
import 'assignments_filter_teacher/assignments_filter_body_teacher.dart';
import '../../../../../router/router_utils.dart';

class AssignmentsSearchAndFilterTeacher extends ConsumerWidget {
  const AssignmentsSearchAndFilterTeacher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = AppSize.width;
    final manager = ref.watch(teacherAssignmentsListManagerProvider.notifier);
    final filter = ref.watch(teacherAssignmentsFilterProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText(
          'Assignment List',
          style: TextStyle(
            fontSize: appFontSizeHuge,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
        ),
        appBoxH8,
        //search bar and filter
        Row(
          children: [
            if (filter.query != null)
              IconButton(
                onPressed: () {
                  filter.resetQuery();
                  manager.setFilteredAssignments();
                  GoRouter.of(context).pushReplacement(AppPages.assignments.toPath);
                },
                icon: const Icon(
                  Icons.clear,
                ),
              ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'assignments.search'.tr(),
                  suffixIcon: const Icon(Icons.search),
                  suffixIconColor: kGray,
                  border: const OutlineInputBorder(
                    borderRadius: appBordRadCir8,
                    borderSide: BorderSide.none,
                  ),
                  focusColor: kWhite,
                  fillColor: kGray.withOpacity(
                    0.15,
                  ),
                ),
                onSubmitted: (value) {
                  filter.setQuery(value);
                  manager.setFilteredAssignments();
                  GoRouter.of(context).pushReplacement(AppPages.assignments.toPath);
                },
              ),
            ),
            appBoxW8,
            Container(
              decoration: BoxDecoration(
                borderRadius: appBordRadCir8,
                color: kGray.withOpacity(
                  0.15,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    showModalSideSheet(
                      barrierDismissible: true,
                      elevation: 10,
                      width: width * 0.7,
                      context: context,
                      ignoreAppBar: false,
                      body: const TeacherFilterCollumn(),
                    );
                  },
                  child: Padding(
                    padding: appPaddingAll8,
                    child: Row(
                      children: [
                        const Icon(Icons.filter_alt_outlined),
                        appBoxW8,
                        AutoSizeText(
                          'assignments.filter'.tr(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        appBoxH8
      ],
    );
  }
}
