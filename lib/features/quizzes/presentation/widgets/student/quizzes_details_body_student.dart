import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_progress_indicators.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../providers/student/quiz_submission_detials_student.dart';
import '../responsiveness/quiz_details_grid.dart';
import '../../../../../main.dart';

class QuizzesDetailsBodyStudent extends ConsumerWidget {
  const QuizzesDetailsBodyStudent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final height = AppSize.height;
    final quiz = ref.watch(quizSubmissionDetailsStudentProvider);
    if (quiz == null) {
      return const Center(
        child: appDefaultCircIndicator,
      );
    }
    return Padding(
      padding: appPaddingSymH12,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // height: height * 0.3,
              width: double.infinity,
              color: kSecondary,
              child: Padding(
                padding: appPaddingSymV20,
                child: isLandscape ? QuizDetailsGridDesktop(quiz: quiz) : QuizDetailsGridMobile(quiz: quiz),
              ),
            ),
            appBoxH20,
            Text(
              quiz.title,
              style: const TextStyle(
                fontSize: appFontSizeVeryLarge,
                fontWeight: FontWeight.bold,
              ),
            ),
            appBoxH8,
            Text(
              quiz.courseTitle,
              style: const TextStyle(
                fontSize: appFontSizeLarge,
              ),
            ),
            appBoxH8,
            const Divider(
              thickness: 2,
            ),
            appBoxH8,
            appSizeBoxH05,
          ],
        ),
      ),
    );
  }
}
