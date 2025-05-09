import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/assignments_filter.dart';
import '../../../../../../core/config/app_sized_box.dart';

class AssignmentsFilterStatusCheckboxStudent extends ConsumerStatefulWidget {
  const AssignmentsFilterStatusCheckboxStudent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AssignmentsFilterStatusCheckboxState();
}

class _AssignmentsFilterStatusCheckboxState extends ConsumerState<AssignmentsFilterStatusCheckboxStudent> {
  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(studentAssignmentsFilterProvider.notifier);
    final filterState = ref.watch(studentAssignmentsFilterProvider);

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
                  value: filterState.isPending,
                  onChanged: (bool? value) {
                    if (value != null) {
                      filter.setPending(value);
                    }
                  },
                ),
                const Text('assignments.pending').tr(),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: filterState.isPassed,
                  onChanged: (bool? value) {
                    if (value != null) {
                      filter.setPassed(value);
                    }
                  },
                ),
                const Text('assignments.passed').tr(),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: filterState.isFailed,
                  onChanged: (bool? value) {
                    if (value != null) {
                      filter.setFailed(value);
                    }
                  },
                ),
                const Text('assignments.failed').tr(),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: filterState.isNotSubmitted,
                  onChanged: (bool? value) {
                    if (value != null) {
                      filter.setNotSubmitted(value);
                    }
                  },
                ),
                const Text('assignments.notSubmitted').tr(),
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
