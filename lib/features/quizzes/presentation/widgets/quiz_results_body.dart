import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/app_progress_indicators.dart';
import '../../../app_parent/presentation/providers/app_parent_states.dart';
import 'student/quiz_results_body_student.dart';
import 'teacher/quiz_results_body_teacher.dart';

class QuizResultsBody extends ConsumerWidget {
  const QuizResultsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userType = ref.watch(AppParentStates.appUserInfo);
    if (userType == null) {
      return const Center(
        child: appDefaultCircIndicator,
      );
    }

    return userType.isTeacher() ? const QuizResultsTeacherBody() : const QuizResultsStudentBody();
  }
}
