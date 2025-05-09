import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/assignments_filter.dart';
import '../../../../../../core/config/app_sized_box.dart';

class AssignmentsFilterStatusCheckboxTeacher extends ConsumerStatefulWidget {
  const AssignmentsFilterStatusCheckboxTeacher({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AssignmentsFilterStatusCheckboxState();
}

class _AssignmentsFilterStatusCheckboxState extends ConsumerState<AssignmentsFilterStatusCheckboxTeacher> {
  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(teacherAssignmentsFilterProvider.notifier);
    final filterState = ref.watch(teacherAssignmentsFilterProvider);

    return Column(
      children: [
        Text(
          'assignments.status'.tr(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: filterState.isActive,
                  onChanged: (bool? value) {
                    if (value != null) {
                      filter.setActive(value);
                    }
                  },
                ),
                const Text('assignments.active').tr(),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: filterState.isExpired,
                  onChanged: (bool? value) {
                    if (value != null) {
                      filter.setExpired(value);
                    }
                  },
                ),
                const Text('assignments.expired').tr(),
              ],
            ),
          ],
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
