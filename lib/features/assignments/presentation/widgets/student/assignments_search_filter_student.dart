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
import '../../providers/assignment_lists_manager.dart';
import '../../providers/assignments_filter.dart';
import 'assignments_filter/assignments_filter_body_student.dart';
import '../../../../../main.dart';
import '../../../../../router/router_utils.dart';

class AssignmentsSearchAndFilterStudent extends ConsumerStatefulWidget {
  const AssignmentsSearchAndFilterStudent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AssignmentsSearchAndFilterStudentState();
}

class _AssignmentsSearchAndFilterStudentState extends ConsumerState<AssignmentsSearchAndFilterStudent> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final manager = ref.watch(studentAssignmentsListManagerProvider.notifier);
    final filter = ref.watch(studentAssignmentsFilterProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'assignments.assignmentList'.tr(),
          style: const TextStyle(
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
                  GoRouter.of(context).pushReplacement('/assignments');
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
                maxLines: 1,
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
                      width: isLandscape ? width * 0.4 : width * 0.7,
                      context: context,
                      ignoreAppBar: false,
                      body: const StudentFilterCollumn(),
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
