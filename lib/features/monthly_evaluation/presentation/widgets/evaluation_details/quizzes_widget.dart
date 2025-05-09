import 'package:flutter/material.dart';

import '../../../domain/entities/quiz.dart';

class QuizzesWidget extends StatelessWidget {
  const QuizzesWidget({
    super.key,
    required this.quizzes,
  });
  final List<Quiz> quizzes;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Quizzes grades', //'evaluations.course'.tr(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        ...quizzes.map(
          (q) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: ListTile(
              title: Text(q.getName(locale)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Grade: ${q.grade}'),
                      Text('Mark: ${q.mark}'),
                      SizedBox.shrink(),
                    ],
                  ),
                  Text(
                    q.comment,
                  ),
                ],
              ),
              trailing: SizedBox(
                width: 60,
                child: Center(
                  child: Text(
                    'Not Submitted',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              // isThreeLine: true,
              tileColor: Colors.grey.withOpacity(0.2),
              textColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
      ],
    );
  }
}
