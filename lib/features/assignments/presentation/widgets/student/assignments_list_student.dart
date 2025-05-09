import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/colors.dart';
import '../../providers/assignment_lists_manager.dart';
import 'assignments_list/assignments_list_builder_student.dart';
import '../../../../common/presentation/providers/pagination.dart';
import '../../../../common/presentation/widgets/paginator.dart';

class AssignmentListStudent extends ConsumerStatefulWidget {
  const AssignmentListStudent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AssignmentListStudentState();
}

class _AssignmentListStudentState extends ConsumerState<AssignmentListStudent> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 16;
    final height = MediaQuery.of(context).size.height;

    final asgManager = ref.watch(studentAssignmentsListManagerProvider.notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: kSecondary,
            borderRadius: appBordRadTLR8,
          ),
          height: height * 0.05,
          child: Row(
            children: [
              const SizedBox(
                width: 50,
              ),
              Flexible(
                child: SizedBox(
                  // width: isDesktop ? width * 0.385 : width * 0.325,
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: AutoSizeText(
                      'assignments.assignmentTitle'.tr(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  width: width * 0.4,
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: AutoSizeText(
                      'assignments.courseClass'.tr(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.135,
              ),
            ],
          ),
        ),
        AssignmentsListBuilderStudent(
          asgManager: asgManager,
          width: width,
          height: height,
          ref: ref,
        ),
        Paginator(
          numberPages: ref.watch(pageManagerProvider.notifier).getPagesCount(asgManager.filteredAssignments),
          onPageChange: (int index) {
            ref.read(pageManagerProvider.notifier).setPage(index + 1);
            setState(() {});
          },
        ),
      ],
    );
  }
}
