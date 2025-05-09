import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_size.dart';
import '../../../../../core/config/paths.dart';

class QuizzesNoneTeacher extends StatelessWidget {
  const QuizzesNoneTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    final width = AppSize.width;
    return Column(
      children: [
        Text(
          'quizzes.quizzesNone'.tr(),
          style: const TextStyle(
            fontSize: appFontSizeHuge,
          ),
        ),
        SizedBox(height: width * 0.05),
        Container(
          width: width,
          height: width * 0.7,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.green[300]!,
                Colors.green[100]!,
              ],
            ),
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            AppPaths.noContentQuiz,
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    );
  }
}
