import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_progress_indicators.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/widgets/error/error_page.dart';
import '../../providers/quizzes.dart';
import '../../providers/teacher/quizzes_manager_student.dart';
import 'quizzes_list_teacher.dart';
import 'quizzes_none_teacher.dart';
import 'quizzes_search_filter_teacher.dart';
import 'quizzes_stat_grid_teacher.dart';

class QuizResultsTeacherBody extends ConsumerWidget {
  const QuizResultsTeacherBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getTeacherQuizzes = ref.watch(getTeacherQuizResultsProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(getTeacherQuizResultsProvider);
      },
      color: kWhite,
      backgroundColor: kSecondary,
      child: getTeacherQuizzes.when(
        skipLoadingOnRefresh: false,
        data: (data) {
          final foldData = data.fold((l) => null, (r) => r);
          final resultList = ref.read(teacherQuizListManagerProvider.notifier).filteredQuizzes;

          if (foldData == null) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ErrorPage(
                errorMessage: 'errors.serverError'.tr(),
                showRefresh: true,
              ),
            );
          }

          final hasQuizzes = resultList.isNotEmpty;

          return Padding(
            padding: appPaddingTLR8,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  QuizzesTeacherStatGrid(
                    qList: foldData.quizzesList,
                  ),
                  const QuizzesSearchAndFilterTeacher(),
                  hasQuizzes
                      ? QuizzesListViewTeacher(
                          fullQList: resultList,
                        )
                      : const QuizzesNoneTeacher(),
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          return Text(error.toString());
        },
        loading: () {
          return const Center(
            child: appDefaultCircIndicator,
          );
        },
      ),
    );
  }
}
