import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_progress_indicators.dart';
import '../../../../../core/config/app_size.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/widgets/error/contents_none.dart';
import '../../../../../core/widgets/error/error_page.dart';
import '../../../../common/presentation/providers/pagination.dart';
import '../../../../common/presentation/widgets/paginator.dart';
import '../../../domain/entities/student/quiz_result.dart';
import '../../../domain/entities/teacher/quiz_submission_teacher.dart';
import '../../../domain/entities/teacher/quiz_submissions__list_teacher.dart';
import '../../providers/quizzes.dart';
import '../../providers/student/quiz_submission_detials_student.dart';
import '../../providers/teacher/quiz_submissions_detials_teacher.dart';
import '../../../../../main.dart';
import '../../../../../router/router_utils.dart';

class QuizzesDetailsBodyTeacher extends ConsumerStatefulWidget {
  const QuizzesDetailsBodyTeacher({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizzesDetailsBodyTeacherState();
}

class _QuizzesDetailsBodyTeacherState extends ConsumerState<QuizzesDetailsBodyTeacher> {
  @override
  Widget build(BuildContext context) {
    final width = AppSize.width - 16;
    final height = AppSize.height;
    final quizId = ref.watch(quizSubmissionsDetailsTeacherProvider);
    final submissions = ref.watch(getTeacherQuizResultsProvider);
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(getTeacherQuizResultsProvider);
      },
      color: kWhite,
      backgroundColor: kSecondary,
      child: submissions.when(
        skipLoadingOnRefresh: true,
        data: (data) {
          final foldData = data.fold((l) => null, (r) => r);

          if (foldData == null) {
            return Center(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ErrorPage(
                  errorMessage: 'errors.serverError'.tr(),
                ),
              ),
            );
          }
          QuizSubmissionsListTeacher? list;
          try {
            list = foldData.quizzesSubmissionsLists.firstWhere(
              (element) => element.quizId == quizId,
            );
          } catch (e) {
            list = null;
          }

          final List<QuizSubmissionTeacher> submissionsPrePaging = list == null
              ? []
              : foldData.quizzesSubmissionsLists
                  .firstWhere(
                    (element) => element.quizId == quizId,
                  )
                  .submissions;

          final submissions = ref.watch(pageManagerProvider.notifier).getPagedList(submissionsPrePaging) as List<QuizSubmissionTeacher>;

          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: appPaddingAll8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: SizedBox(
                      height: 25,
                      child: BackButton(),
                    ),
                  ),
                  appSizeBoxH02,
                  Container(
                    decoration: const BoxDecoration(
                      color: kSecondary,
                      borderRadius: appBordRadTLR8,
                    ),
                    height: height * 0.05,
                    child: Row(
                      children: [
                        appSizeBoxW1,
                        SizedBox(
                          width: width * 0.35,
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: AutoSizeText(
                              'assignments.student'.tr(),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: kWhite,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: submissions.isEmpty
                        ? SizedBox(
                            height: height * 0.8,
                            child: Center(
                              child: SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: ContentsNone(
                                  text: 'quizzes.noQuizzes'.tr(),
                                ),
                              ),
                            ),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: submissions.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: appPaddingB8,
                                child: ExpansionTile(
                                  collapsedShape: RoundedRectangleBorder(
                                    borderRadius: index == 0 ? appBordRadBLR8 : appBordRadCir8,
                                  ),
                                  shape: index == 0
                                      ? const RoundedRectangleBorder(
                                          borderRadius: appBordRadBLR8,
                                        )
                                      : const RoundedRectangleBorder(
                                          borderRadius: appBordRadCir8,
                                        ),
                                  backgroundColor: kGray.withOpacity(0.15),
                                  collapsedBackgroundColor: kGray.withOpacity(0.15),
                                  iconColor: kGray,
                                  collapsedIconColor: kGray,
                                  controlAffinity: ListTileControlAffinity.leading,
                                  trailing: null,
                                  title: Row(
                                    children: [
                                      Padding(
                                        padding: appPaddingR8,
                                        child: Container(
                                            width: width * 0.1,
                                            height: width * 0.1,
                                            decoration: BoxDecoration(
                                              color: kGray.withOpacity(0.15),
                                              shape: BoxShape.circle,
                                            ),
                                            child: FittedBox(
                                              fit: BoxFit.cover,
                                              child: CircleAvatar(
                                                child: submissions[index].userAvatar == null
                                                    ? null
                                                    : Image.network(
                                                        submissions[index].userAvatar!,
                                                        fit: BoxFit.cover,
                                                        width: width * 0.15,
                                                        height: width * 0.13,
                                                      ),
                                              ),
                                            )),
                                      ),
                                      Flexible(
                                        child: Align(
                                          alignment: AlignmentDirectional.centerStart,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                submissions[index].userName,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  color: kSecondary,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                maxLines: 1,
                                              ),
                                              AutoSizeText(
                                                submissions[index].userEmail,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: kGray.withOpacity(0.6),
                                                ),
                                                maxLines: 1,
                                                maxFontSize: appMaxSubTitleFontSize,
                                                minFontSize: appMinSubTitleFontSize,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional.centerStart,
                                        child: AutoSizeText(
                                          submissions[index].status == 'waiting'
                                              ? 'quizzes.waiting'.tr()
                                              : submissions[index].status == 'passed'
                                                  ? 'quizzes.passed'.tr()
                                                  : 'quizzes.failed'.tr(),
                                          style: TextStyle(
                                            color: submissions[index].status == 'waiting'
                                                ? kWarning
                                                : submissions[index].status == 'passed'
                                                    ? kGreen
                                                    : kRed,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: width * 0.15,
                                          child: IconButton(
                                            icon: const Icon(Icons.remove_red_eye_outlined),
                                            iconSize: 20,
                                            onPressed: () {
                                              final quiz = getStudentQuizResultObject(submissions[index]);

                                              ref.read(quizSubmissionDetailsStudentProvider.notifier).setQuiz(quiz);
                                              context.push(AppPages.quizzesDetailsStudent.toPath);
                                            },
                                            color: kDark,
                                          ),
                                        ),
                                        Flexible(
                                          child: Align(
                                            alignment: AlignmentDirectional.centerStart,
                                            child: AutoSizeText(
                                              'quizzes.submissionDate'.tr(),
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: kSecondary,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 1,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Align(
                                            alignment: AlignmentDirectional.centerEnd,
                                            child: AutoSizeText(
                                              submissions[index].submissionDate == null
                                                  ? '-'
                                                  : DateFormat('dd MMM yyyy | h:mm a').format(submissions[index].submissionDate!),
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: kGray.withOpacity(0.6),
                                              ),
                                              maxLines: 1,
                                              maxFontSize: appMaxSubTitleFontSize,
                                              minFontSize: appMinSubTitleFontSize,
                                            ),
                                          ),
                                        ),
                                        appSizeBoxW05,
                                      ],
                                    ),
                                    appSizeBoxH01,
                                    Row(
                                      children: [
                                        appSizeBoxW15,
                                        Flexible(
                                          child: Align(
                                            alignment: AlignmentDirectional.centerStart,
                                            child: AutoSizeText(
                                              'quizzes.reviewerDeadline'.tr(),
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: kSecondary,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 1,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Align(
                                            alignment: AlignmentDirectional.centerEnd,
                                            child: AutoSizeText(
                                              submissions[index].reviewerDeadline,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: kGray.withOpacity(0.6),
                                              ),
                                              maxLines: 1,
                                              maxFontSize: appMaxSubTitleFontSize,
                                              minFontSize: appMinSubTitleFontSize,
                                            ),
                                          ),
                                        ),
                                        appSizeBoxW05,
                                      ],
                                    ),
                                    appSizeBoxH02,
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                  Paginator(
                    numberPages: ref.watch(pageManagerProvider.notifier).getPagesCount(submissionsPrePaging),
                    onPageChange: (int index) {
                      ref.read(pageManagerProvider.notifier).setPage(index + 1);
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          return ErrorPage(
            errorMessage: 'errors.serverError'.tr(),
            showRefresh: !isDesktop,
          );
        },
        loading: () => appDefaultCircIndicator,
      ),
    );
  }
}

QuizResult getStudentQuizResultObject(QuizSubmissionTeacher studentSubmission) {
  return QuizResult(
    id: studentSubmission.quizId,
    submissionDate: studentSubmission.submissionDate,
    userAttempts: studentSubmission.userAttempts,
    totalAttempts: studentSubmission.totalAttempts,
    status: studentSubmission.status,
    title: studentSubmission.quizTitle,
    courseTitle: studentSubmission.courseTitle,
    dueDate: studentSubmission.reviewerDeadline,
    maxMark: studentSubmission.maxMark,
    passMark: studentSubmission.passMark,
    totalMark: studentSubmission.totalMark,
  );
}
