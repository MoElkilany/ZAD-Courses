import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_progress_indicators.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/widgets/error/contents_none.dart';
import '../../../../../core/widgets/error/error_page.dart';
import '../../../domain/entities/teacher_assignments_list.dart';
import '../../providers/assignment_lists_manager_teacher.dart';
import '../../providers/assignments.dart';
import 'assingments_list_teacher.dart';
import 'assignments_search_filter_teacher.dart';
import 'assignments_stat_grid_teacher.dart';

class AssignmentsTeacherBody extends ConsumerStatefulWidget {
  const AssignmentsTeacherBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AssignmentsTeacherBodyState();
}

class _AssignmentsTeacherBodyState extends ConsumerState<AssignmentsTeacherBody> {
  @override
  Widget build(BuildContext context) {
    AsyncValue<Either<Failure, TeacherAssignmentsList>> assignments = ref.watch(getTeacherAssignmentsProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(getTeacherAssignmentsProvider);
      },
      color: kWhite,
      backgroundColor: kSecondary,
      child: assignments.when(
        skipLoadingOnRefresh: false,
        data: (data) {
          final foldData = data.fold((l) => null, (r) => r);

          if (foldData == null) {
            return Center(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ErrorPage(
                  errorMessage: 'errors.serverError'.tr(),
                ),
              ),
            );
          }
          final asgManager = ref.watch(teacherAssignmentsListManagerProvider.notifier);

          final hasAssignments = asgManager.filteredAssignments.isNotEmpty;
          return Padding(
            padding: appPaddingTLR8,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  AssignmentsTeacherStatGrid(
                    asgList: foldData,
                  ),
                  const AssignmentsSearchAndFilterTeacher(),
                  hasAssignments
                      ? AssignmentListTeacher(
                          filteredAsgs: asgManager.filteredAssignments,
                        )
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
        },
      ),
    );
  }
}
