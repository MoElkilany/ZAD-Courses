import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';

import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_size.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../router/router_utils.dart';
import '../../../domain/entities/student/quiz_result.dart';
import '../../providers/student/quizzes_filter_student.dart';
import '../../providers/student/quizzes_manager_student.dart';

class QuizzesSearchAndFilterStudent extends ConsumerStatefulWidget {
  const QuizzesSearchAndFilterStudent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizzesSearchAndFilterStudentState();
}

class _QuizzesSearchAndFilterStudentState extends ConsumerState<QuizzesSearchAndFilterStudent> {
  @override
  Widget build(BuildContext context) {
    final width = AppSize.width;
    final filter = ref.watch(studentQuizResultsFilterProvider.notifier);
    final manager = ref.watch(studentResultsListManagerProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'quizzes.quizList'.tr(),
          style: const TextStyle(
            fontSize: appFontSizeHuge,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
        ),
        appBoxH8,
        //search bar and filter
        Row(
          children: [
            if (filter.query != null)
              IconButton(
                onPressed: () {
                  filter.resetQuery();
                  manager.setFilteredQuizzes();
                  GoRouter.of(context).pushReplacement(AppPages.quizResults.toPath);
                },
                icon: const Icon(
                  Icons.clear,
                ),
              ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'assignments.search'.tr(),
                  suffixIcon: const Icon(Icons.search),
                  suffixIconColor: kGray,
                  border: const OutlineInputBorder(
                    borderRadius: appBordRadCir8,
                    borderSide: BorderSide.none,
                  ),
                  focusColor: kWhite,
                  fillColor: kGray.withOpacity(
                    0.15,
                  ),
                ),
                onSubmitted: (value) {
                  filter.setQuery(value);
                  manager.setFilteredQuizzes();
                  GoRouter.of(context).pushReplacement(AppPages.quizResults.toPath);
                },
                maxLines: 1,
              ),
            ),
            appBoxW8,
            Container(
              decoration: BoxDecoration(
                borderRadius: appBordRadCir8,
                color: kGray.withOpacity(
                  0.15,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    showModalSideSheet(
                      barrierDismissible: true,
                      elevation: 10,
                      width: width * 0.7,
                      context: context,
                      ignoreAppBar: false,
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appSizeBoxH05,
                          Padding(
                            padding: appPaddingDirecS8,
                            child: Text(
                              'assignments.filters'.tr(),
                              style: const TextStyle(
                                fontSize: appFontSizeHuge,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          appSizeBoxH01,
                          const Divider(
                            thickness: 1,
                          ),
                          appSizeBoxH01,
                          Padding(
                            padding: appPaddingDirecS8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'assignments.courseClass'.tr(),
                                  style: const TextStyle(
                                    fontSize: appFontSizeLarge,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                DropdownButton<QuizResult>(
                                  value: manager.selectedQuiz,
                                  isExpanded: true,
                                  icon: const Padding(
                                    padding: appPaddingAll8,
                                    child: Icon(
                                      Icons.arrow_downward,
                                    ),
                                  ),
                                  iconSize: 14,
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.black),
                                  underline: Container(
                                    height: 2,
                                    color: kPrimary,
                                  ),
                                  borderRadius: appBordRadCir8,
                                  hint: Text('assignments.selectSession'.tr()),
                                  onChanged: (QuizResult? newValue) {
                                    manager.setSelectedQuiz(newValue);
                                    setState(() {});
                                  },
                                  items: manager.dropDownQuizzesItems,
                                ),
                                appSizeBoxH01,
                                const Divider(
                                  thickness: 1,
                                ),
                                appSizeBoxH01,
                                Text(
                                  'assignments.status'.tr(),
                                  style: const TextStyle(
                                    fontSize: appFontSizeLarge,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const CheckboxCol(),
                                appSizeBoxH01,
                                const Divider(
                                  thickness: 1,
                                ),
                                Column(
                                  children: [
                                    Center(
                                      child: //reset button
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius: appBordRadCir8,
                                          color: kGray.withOpacity(0.2),
                                        ),
                                        child: Padding(
                                          padding: appPaddingSymH12,
                                          child: TextButton(
                                            onPressed: () {
                                              manager.setFilteredQuizzes();
                                              Navigator.pop(context);
                                              GoRouter.of(context).pushReplacement(AppPages.quizResults.toPath);

                                              // widget.callback();
                                            },
                                            child: Text(
                                              'assignments.show'.tr(),
                                              style: const TextStyle(
                                                color: kDark,
                                                fontSize: appFontSizeMedium,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    appSizeBoxH01,
                                    Center(
                                      child: //reset button
                                          Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: appBordRadCir8,
                                          color: kSecondary,
                                        ),
                                        child: Padding(
                                          padding: appPaddingSymH12,
                                          child: TextButton(
                                            onPressed: () {
                                              filter.resetAll();
                                              setState(() {});
                                              manager.resetSelectedQuiz();
                                              manager.resetFilteredQuizzes();
                                              Navigator.pop(context);
                                              GoRouter.of(context).pushReplacement(AppPages.quizResults.toPath);
                                            },
                                            child: Text(
                                              'assignments.reset'.tr(),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: appFontSizeMedium,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    appSizeBoxH05,
                                  ],
                                ),
                              ],
                            ),
                          ),
                          appSizeBoxH01,
                        ],
                      ),
                    );
                  },
                  child: Padding(
                    padding: appPaddingAll8,
                    child: Row(
                      children: [
                        const Icon(Icons.filter_alt_outlined),
                        appBoxW8,
                        AutoSizeText(
                          'assignments.filter'.tr(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        appBoxH8
      ],
    );
  }
}

class CheckboxCol extends ConsumerStatefulWidget {
  const CheckboxCol({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckboxColState();
}

class _CheckboxColState extends ConsumerState<CheckboxCol> {
  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(studentQuizResultsFilterProvider.notifier);
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: filter.isWaiting,
              onChanged: (bool? value) {
                if (value != null) {
                  filter.setIsWaiting(value);
                  setState(() {});
                }
              },
            ),
            Text('quizzes.waiting'.tr()),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: filter.isPassed,
              onChanged: (bool? value) {
                if (value != null) {
                  filter.setIsPassed(value);
                  setState(() {});
                }
              },
            ),
            Text('quizzes.passed'.tr()),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: filter.isFailed,
              onChanged: (bool? value) {
                if (value != null) {
                  filter.setIsFailed(value);
                  setState(() {});
                }
              },
            ),
            Text('quizzes.failed'.tr()),
          ],
        ),
      ],
    );
  }
}
