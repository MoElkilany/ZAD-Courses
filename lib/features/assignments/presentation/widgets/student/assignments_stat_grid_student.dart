import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_progress_indicators.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/types/app_types.dart';
import '../../../domain/entities/student_assignments_list.dart';
import '../../providers/assignments.dart';
import '../assignments_card.dart';

class AssignmentsStudentStatGrid extends ConsumerWidget {
  const AssignmentsStudentStatGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Either<Failure, StudentAssignmentsList>> assignments = ref.watch(
      getStudentAssignmentsProvider,
    );
    return assignments.when(
      data: (data) {
        final foldedData = data.fold((l) => null, (r) => r);
        if (foldedData == null) {
          return Padding(
            padding: appPaddingSymV16,
            child: const Text('errors.responseError').tr(),
          );
        }
        return Column(
          children: [
            Row(
              children: [
                AssignmentsCard(
                  asgStatType: AsgStatType.all,
                  num: foldedData.numAssignments,
                  active: foldedData.numActive,
                  expired: foldedData.numAssignments - foldedData.numActive,
                ),
                AssignmentsCard(
                  asgStatType: AsgStatType.submitted,
                  num: foldedData.numSubmitted,
                ),
              ],
            ),
            // Row(
            //   children: [
            //     AssignmentsCard(
            //       asgStatType: AsgStatType.pending,
            //       num: foldedData.numPending,
            //     ),
            //     AssignmentsCard(
            //       asgStatType: AsgStatType.failed,
            //       num: foldedData.numFailed,
            //     ),
            //   ],
            // ),
            appBoxH8,
          ],
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () {
        return const Center(child: appDefaultCircIndicator);
      },
    );
  }
}
