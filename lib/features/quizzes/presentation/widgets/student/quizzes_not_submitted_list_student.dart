import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/config/app_size.dart';
import '../../../../common/presentation/providers/pagination.dart';
import '../../../../common/presentation/widgets/paginator.dart';
import '../../../domain/entities/student/quiz_not_submitted.dart';
import '../../providers/student/quizzes_manager_student.dart';

class QuizzesNotSubmittedListStudent extends ConsumerStatefulWidget {
  const QuizzesNotSubmittedListStudent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizzesNotSubmittedListStudentState();
}

class _QuizzesNotSubmittedListStudentState extends ConsumerState<QuizzesNotSubmittedListStudent> {
  @override
  Widget build(BuildContext context) {
    final List<QuizNotSubmitted> qListPrePaging = ref.watch(studentNotSubmittedListManagerProvider.notifier).filteredQuizzes;
    final qList = ref.watch(pageManagerProvider.notifier).getPagedList(qListPrePaging) as List<QuizNotSubmitted>;
    final width = AppSize.width - 16;
    final height = AppSize.height;
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
                      appSizeBoxW1,
                    ],
                  ),
                  children: [
                    Row(
                      children: [
                        appSizeBoxW1,
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  'quizzes.questions'.tr(),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: kSecondary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                ),
                                AutoSizeText(
                                  '${qList[index].questionCount ?? '-'}',
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
                                  'quizzes.duration'.tr(),
                                  style: const TextStyle(
                                    color: kDark,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                AutoSizeText(
                                  '${qList[index].quizTime ?? '-'}',
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
                        appSizeBoxW1,
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
          numberPages: ref.watch(pageManagerProvider.notifier).getPagesCount(qListPrePaging),
          onPageChange: (int index) {
            ref.read(pageManagerProvider.notifier).setPage(index + 1);
            setState(() {});
          },
        ),
      ],
    );
  }
}
