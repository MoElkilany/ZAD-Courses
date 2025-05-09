import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/app_progress_indicators.dart';
import '../../../app_parent/presentation/providers/app_parent_states.dart';
import 'student/assignments_body_student.dart';
import 'teacher/assignments_body_teacher.dart';

class AssignmentsBody extends ConsumerStatefulWidget {
  const AssignmentsBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AssignmentsBodyState();
}

class _AssignmentsBodyState extends ConsumerState<AssignmentsBody> {
  @override
  Widget build(BuildContext context) {
    final userType = ref.watch(AppParentStates.appUserInfo);
    if (userType == null) {
      return const Center(
        child: appDefaultCircIndicator,
      );
    }
    return userType.isTeacher() ? const AssignmentsTeacherBody() : const AssignmentsStudentBody();
  }
}
