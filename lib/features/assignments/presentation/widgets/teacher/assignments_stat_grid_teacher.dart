import 'package:flutter/material.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/types/app_types.dart';
import '../../../domain/entities/teacher_assignments_list.dart';
import '../assignments_card.dart';

class AssignmentsTeacherStatGrid extends StatelessWidget {
  const AssignmentsTeacherStatGrid({
    super.key,
    required this.asgList,
  });

  final TeacherAssignmentsList asgList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AssignmentsCard(
              asgStatType: AsgStatType.all,
              num: asgList.numAssignments,
              active: asgList.numActive,
              expired: asgList.numExpired,
            ),
            AssignmentsCard(
              asgStatType: AsgStatType.submitted,
              num: asgList.numSubmitted,
            ),
          ],
        ),
        appBoxH8,
      ],
    );
  }
}
