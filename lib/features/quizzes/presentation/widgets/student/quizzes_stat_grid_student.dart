import 'package:flutter/material.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/types/app_types.dart';
import '../../../domain/entities/student/quiz_results_list.dart';
import '../quizzes_card.dart';

class QuizzesStudentStatGrid extends StatelessWidget {
  const QuizzesStudentStatGrid({
    super.key,
    required this.qList,
  });

  final QuizResultsList qList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            QuizzesCard(
              quizStatType: QuizStatType.all,
              num: qList.all,
            ),
            QuizzesCard(
              quizStatType: QuizStatType.passed,
              num: qList.passed,
            ),
          ],
        ),
        Row(
          children: [
            QuizzesCard(
              quizStatType: QuizStatType.open,
              num: qList.open,
            ),
            QuizzesCard(
              quizStatType: QuizStatType.failed,
              num: qList.failed,
            ),
          ],
        ),
        appBoxH8,
      ],
    );
  }
}
