import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_progress_indicators.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/error/failures.dart';
import '../../../domain/entities/student_assignments_list.dart';
import '../../providers/assignment_lists_manager.dart';
import '../../providers/assignments.dart';
import 'assignments_list_student.dart';
import '../../../../../core/widgets/error/contents_none.dart';
import 'assignments_search_filter_student.dart';
import 'assignments_stat_grid_student.dart';

class AssignmentsStudentBody extends ConsumerStatefulWidget {
  const AssignmentsStudentBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AssignmentsStudentBodyState();
}

class _AssignmentsStudentBodyState extends ConsumerState<AssignmentsStudentBody> {
  @override
  Widget build(BuildContext context) {
    AsyncValue<Either<Failure, StudentAssignmentsList>> assignments = ref.watch(getStudentAssignmentsProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(getStudentAssignmentsProvider);
      },
      color: kWhite,
      backgroundColor: kSecondary,
      child: assignments.when(
          skipLoadingOnRefresh: false,
          data: (data) {
            final asgManager = ref.watch(studentAssignmentsListManagerProvider.notifier);

            final hasAssignments = asgManager.filteredAssignments.isNotEmpty;

            return Padding(
              padding: appPaddingTLR8,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const AssignmentsStudentStatGrid(),
                    const AssignmentsSearchAndFilterStudent(),
                    hasAssignments
                        ? const AssignmentListStudent()
                        : ContentsNone(
                            text: 'assignments.noAssignments'.tr(),
                          ),
                  ],
                ),
              ),
            );
          },
          error: (error, stackTrace) {
            return Text(error.toString());
          },
          loading: () {
            return const Center(child: appDefaultCircIndicator);
          }),
    );
  }
}
