import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/config/app_border.dart';
import '../../../../../../core/config/app_padding.dart';
import '../../../../../../core/config/colors.dart';
import '../../../../domain/entities/student_assignment.dart';
import '../../../providers/assignment_lists_manager.dart';
import 'expansion_tile_children_student.dart';
import 'expansion_tile_row_title_student.dart';
import '../../../../../common/presentation/providers/pagination.dart';

class AssignmentsListBuilderStudent extends StatelessWidget {
  const AssignmentsListBuilderStudent({
    super.key,
    required this.asgManager,
    required this.width,
    required this.height,
    required this.ref,
  });

  final StudentAssignmentsListManager asgManager;
  final double width;
  final double height;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final aList = ref.watch(pageManagerProvider.notifier).getPagedList(asgManager.filteredAssignments) as List<StudentAssignment>;
    return Flexible(
      fit: FlexFit.loose,
      child: Consumer(builder: (context, watch, child) {
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: aList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            StudentAssignment asg = aList[index];

            return Padding(
              padding: appPaddingB8,
              child: ExpansionTile(
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: index == 0 ? appBordRadBLR8 : appBordRadCir8,
                ),
                shape: index == 0
                    ? const RoundedRectangleBorder(
                        borderRadius: appBordRadBLR8,
                      )
                    : const RoundedRectangleBorder(
                        borderRadius: appBordRadCir8,
                      ),
                backgroundColor: kGray.withOpacity(0.15),
                collapsedBackgroundColor: kGray.withOpacity(0.15),
                iconColor: kGray,
                collapsedIconColor: kGray,
                controlAffinity: ListTileControlAffinity.leading,
                trailing: null,
                title: ExpansionTileRowTitleStudent(asg: asg),
                children: getExpansionTileChildren(
                  width,
                  height,
                  asg,
                  ref,
                  context,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
