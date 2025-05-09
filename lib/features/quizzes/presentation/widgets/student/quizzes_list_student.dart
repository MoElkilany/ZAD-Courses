import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_size.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../router/router_utils.dart';
import '../../../../common/presentation/providers/pagination.dart';
import '../../../../common/presentation/widgets/paginator.dart';
import '../../../domain/entities/student/quiz_result.dart';
import '../../providers/student/quiz_submission_detials_student.dart';

class QuizzesListStudent extends ConsumerStatefulWidget {
  const QuizzesListStudent({
    super.key,
    required this.qList,
  });
  final List<QuizResult> qList;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizzesListStudentState();
}

class _QuizzesListStudentState extends ConsumerState<QuizzesListStudent> {
  @override
  Widget build(BuildContext context) {
    final width = AppSize.width - 16;
    final height = AppSize.height;

    final qList = ref.watch(pageManagerProvider.notifier).getPagedList(widget.qList) as List<QuizResult>;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: kSecondary,
            borderRadius: appBordRadTLR8,
          ),
          height: height * 0.05,
          child: Row(
            children: [
              const SizedBox(
                width: 50,
              ),
              Flexible(
                child: SizedBox(
                  // width: width * 0.35,
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: AutoSizeText(
                      'quizzes.quizTitle'.tr(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  width: width * 0.4,
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: AutoSizeText(
                      'assignments.courseClass'.tr(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.135,
              ),
            ],
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: qList.length,
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
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                qList[index].title,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: kSecondary,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                              ),
                              AutoSizeText(
                                qList[index].dueDate == null ? '-' : qList[index].dueDate!,
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
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: appPaddingDirecE8,
                                child: AutoSizeText(
                                  qList[index].courseTitle,
                                  style: const TextStyle(
                                    color: kBlue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: AutoSizeText(
                          qList[index].status == 'waiting'
                              ? 'quizzes.waiting'.tr()
                              : qList[index].status == 'passed'
                                  ? 'quizzes.passed'.tr()
                                  : 'quizzes.failed'.tr(),
                          style: TextStyle(
                            color: qList[index].status == 'waiting'
                                ? kWarning
                                : qList[index].status == 'passed'
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
                              ref.read(quizSubmissionDetailsStudentProvider.notifier).setQuiz(qList[index]);
                              context.push(AppPages.quizzesDetailsStudent.toPath);
                            },
                            color: kDark,
                          ),
                        ),
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  'quizzes.submissionDate'.tr(),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: kSecondary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                ),
                                AutoSizeText(
                                  qList[index].submissionDate == null ? '-' : DateFormat('dd MMM yyyy | h:mm a').format(qList[index].submissionDate!),
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
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  'assignments.deadline'.tr(),
                                  style: const TextStyle(
                                    color: kDark,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                AutoSizeText(
                                  qList[index].dueDate == null ? '-' : qList[index].dueDate!,
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
                        appSizeBoxW15,
                      ],
                    ),
                    appSizeBoxH01,
                    Row(
                      children: [
                        appSizeBoxW15,
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  'quizzes.yourMark'.tr(),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: kSecondary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                ),
                                AutoSizeText(
                                  '${qList[index].totalMark ?? '-'}/${qList[index].maxMark ?? '-'}',
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
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  'quizzes.passMark'.tr(),
                                  style: const TextStyle(
                                    color: kDark,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                AutoSizeText(
                                  qList[index].passMark == null ? '-' : '${qList[index].passMark}',
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
                        appSizeBoxW15,
                        // SizedBox(
                        //   width: width * 0.15,
                        //   child: IconButton(
                        //     onPressed: () {
                        //       context.push('/quizzesDetailsStudent');
                        //     },
                        //     icon: const Icon(
                        //       Icons.remove_red_eye_outlined,
                        //       color: kSecondary,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    appSizeBoxH01,
                  ],
                ),
              );
            },
          ),
        ),
        Paginator(
          numberPages: ref.watch(pageManagerProvider.notifier).getPagesCount(widget.qList),
          onPageChange: (int index) {
            ref.read(pageManagerProvider.notifier).setPage(index + 1);
            setState(() {});
          },
        ),
      ],
    );
  }
}
