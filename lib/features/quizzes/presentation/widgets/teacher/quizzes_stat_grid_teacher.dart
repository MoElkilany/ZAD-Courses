import 'package:flutter/material.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/types/app_types.dart';
import '../../../domain/entities/teacher/quiz_teacher.dart';
import '../quizzes_card.dart';

class QuizzesTeacherStatGrid extends StatelessWidget {
  const QuizzesTeacherStatGrid({
    super.key,
    required this.qList,
  });

  final List<QuizTeacher> qList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            QuizzesCard(
              quizStatType: QuizStatType.all,
              num: qList.length,
              expired: qList.where((e) => e.status != "active").length,
            ),
          ],
        ),
        appBoxH8,
      ],
    );
  }
}
