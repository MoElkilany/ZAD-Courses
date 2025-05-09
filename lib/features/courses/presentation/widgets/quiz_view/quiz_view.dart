import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_progress_indicators.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/widgets/error/error_page.dart';
import '../../../domain/entities/course.dart';
import '../../providers/course.dart';
import '../../providers/quiz_providers.dart';
import 'quiz_row.dart';

class QuizzesTabBarView extends ConsumerStatefulWidget {
  const QuizzesTabBarView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizzesTabBarViewState();
}

class _QuizzesTabBarViewState extends ConsumerState<QuizzesTabBarView> {
  final _scrollController = ScrollController(initialScrollOffset: 0);

  @override
  Widget build(BuildContext context) {
    AsyncValue<Either<Failure, Course>> course = ref.watch(
      getCourseProvider,
    );
    return RefreshIndicator(
      onRefresh: () async {
        ref.read(refreshCourseProvider);
      },
      color: kWhite,
      backgroundColor: kSecondary,
      child: course.when(
        skipLoadingOnRefresh: false,
        loading: () => const Center(
          child: appDefaultCircIndicator,
        ),
        error: (error, stack) => Center(
          child: Text(
            error.toString(),
          ),
        ),
        data: (data) {
          final course = data.fold((l) => null, (r) => r);
          if (course == null) {
            // ref.read(refreshCourseProvider);
            return Center(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ErrorPage(
                  errorMessage: 'learning.courseNotFound'.tr(),
                ),
              ),
            );
          }

          final quizzes = course.courseQuizzes;
          if (quizzes.isEmpty) {
            return Center(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ErrorPage(
                  errorMessage: 'learning.noQuizzes'.tr(),
                ),
              ),
            );
          }
          return Scrollbar(
            controller: _scrollController,
            thumbVisibility: true,
            child: Padding(
              padding: appPaddingSymH4,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: _scrollController,
                itemCount: quizzes.length,
                itemBuilder: (context, index) {
                  final quiz = quizzes[index];
                  return InkWell(
                    onTap: () {},
                    child: QuizRow(
                      title: quiz.title,
                      quizId: quiz.id,
                      status: ref.watch(
                        getQuizStatusProvider(quizId: quiz.id),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
