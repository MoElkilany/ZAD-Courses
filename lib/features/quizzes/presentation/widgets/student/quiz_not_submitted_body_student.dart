import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_progress_indicators.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/widgets/error/error_page.dart';
import '../../providers/quizzes.dart';
import '../../providers/student/quizzes_manager_student.dart';
import 'quizzes_none_student.dart';
import 'quizzes_not_submitted_list_student.dart';
import 'quizzes_not_submitted_search_filter_student.dart';

class QuizNotSubmittedStudentBody extends ConsumerWidget {
  const QuizNotSubmittedStudentBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getStudentQuizNotSubmitted = ref.watch(getStudentQuizzesNotSubmittedProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(getStudentQuizzesNotSubmittedProvider);
      },
      color: kWhite,
      backgroundColor: kSecondary,
      child: getStudentQuizNotSubmitted.when(
        skipLoadingOnRefresh: false,
        data: (data) {
          final foldData = data.fold((l) => null, (r) => r);
          final resultList = ref.read(studentNotSubmittedListManagerProvider.notifier).filteredQuizzes;
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
                  const QuizzesNotSubmittedSearchAndFilterStudent(),
                  hasQuizzes ? const QuizzesNotSubmittedListStudent() : const QuizzesNoneStudent(),
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
