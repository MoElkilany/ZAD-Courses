import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_progress_indicators.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/widgets/error/error_page.dart';
import '../../providers/quizzes.dart';
import '../../providers/student/quizzes_manager_student.dart';
import 'quizzes_list_student.dart';
import 'quizzes_none_student.dart';
import 'quizzes_search_filter_student.dart';
import 'quizzes_stat_grid_student.dart';

class QuizResultsStudentBody extends ConsumerWidget {
  const QuizResultsStudentBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getStudentQuizResults = ref.watch(getStudentQuizResultsProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(getStudentQuizResultsProvider);
      },
      color: kWhite,
      backgroundColor: kSecondary,
      child: getStudentQuizResults.when(
        skipLoadingOnRefresh: false,
        data: (data) {
          final foldData = data.fold((l) => null, (r) => r);
          final resultList = ref.read(studentResultsListManagerProvider.notifier).filteredQuizzes;

          if (foldData == null) {
            return ErrorPage(
              errorMessage: 'errors.serverError'.tr(),
              showRefresh: true,
            );
          }

          final hasQuizzes = resultList.isNotEmpty;
          return Padding(
            padding: appPaddingTLR8,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  QuizzesStudentStatGrid(
                    qList: foldData,
                  ),
                  const QuizzesSearchAndFilterStudent(),
                  hasQuizzes
                      ? QuizzesListStudent(
                          qList: resultList,
                        )
                      : const QuizzesNoneStudent(),
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
