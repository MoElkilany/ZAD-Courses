import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/types/app_types.dart';
import '../../../../../router/router_utils.dart';
import '../../../../app_parent/presentation/providers/app_parent_states.dart';
import '../../../../quizzes/presentation/providers/teacher/quiz_submissions_detials_teacher.dart';

class QuizRow extends ConsumerWidget {
  const QuizRow({
    super.key,
    required this.title,
    required this.status,
    required this.quizId,
  });
  final String title;
  final QuizStatus status;
  final int quizId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: appPaddingSymV12,
      child: Row(
        children: [
          appBoxW16,
          const Icon(Icons.notes_rounded),
          appBoxW16,
          Expanded(
            child: AutoSizeText(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          appBoxW16,
          IconButton(
            icon: const Icon(Icons.open_in_new_rounded),
            onPressed: () {
              ref.read(AppParentStates.appUserInfo)!.isTeacher() ? goToTeacherQuizDetails(ref, context) : goToStudentQuizDetails(ref, context);
            },
          ),
          appBoxW16,
        ],
      ),
    );
  }

  void goToStudentQuizDetails(WidgetRef ref, BuildContext context) {
    context.push(AppPages.quizResults.toPath);
  }

  void goToTeacherQuizDetails(WidgetRef ref, BuildContext context) {
    ref.read(quizSubmissionsDetailsTeacherProvider.notifier).setQuiz(quizId);
    context.push(AppPages.quizzesDetailsTeacher.toPath);
  }
}
