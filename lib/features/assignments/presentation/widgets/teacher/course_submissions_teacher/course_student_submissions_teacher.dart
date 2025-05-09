import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/config/app_border.dart';
import '../../../../../../core/config/app_font_size.dart';
import '../../../../../../core/config/app_padding.dart';
import '../../../../../../core/config/app_progress_indicators.dart';
import '../../../../../../core/config/app_sized_box.dart';
import '../../../../../../core/config/colors.dart';
import '../../../../../../core/config/app_size.dart';
import '../../../../../../core/widgets/error/contents_none.dart';
import '../../../../../../core/widgets/error/error_page.dart';
import '../../../../domain/entities/student_assignment.dart';
import '../../../../domain/entities/student_submissions.dart';
import '../../../providers/assignment_details.dart';
import '../../../providers/assignments.dart';
import '../../../../../common/presentation/providers/pagination.dart';
import '../../../../../common/presentation/widgets/paginator.dart';
import '../../../../../../main.dart';
import '../../../../../../router/router_utils.dart';

class CourseStudentSubmissionsTeacher extends ConsumerStatefulWidget {
  const CourseStudentSubmissionsTeacher({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CourseStudentSubmissionsTeacherState();
}

class _CourseStudentSubmissionsTeacherState extends ConsumerState<CourseStudentSubmissionsTeacher> {
  @override
  Widget build(BuildContext context) {
    final width = AppSize.width - 16;
    final height = AppSize.height;

    final asyncSubm = ref.watch(getStudentSubmissionsProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(getStudentSubmissionsProvider);
      },
      color: kWhite,
      backgroundColor: kSecondary,
      child: asyncSubm.when(
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
          final List<StudentSubmission> prePagingsubmissions = foldData;

          final submissions = ref.watch(pageManagerProvider.notifier).getPagedList(prePagingsubmissions) as List<StudentSubmission>;

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
                                  text: 'assignments.noAssignments'.tr(),
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
                                                child: Image.network(
                                                  submissions[index].studentAvatar,
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
                                                submissions[index].studentName,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  color: kSecondary,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                maxLines: 1,
                                              ),
                                              AutoSizeText(
                                                submissions[index].studentEmail,
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
                                          submissions[index].studentStatus == 'not_submitted'
                                              ? 'assignments.notSubmitted'.tr()
                                              : 'assignments.submitted'.tr(),
                                          style: TextStyle(
                                            color: submissions[index].studentStatus == 'not_submitted' ? kRed : kGreen,
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
                                              final asg = getStudentAssignmentObject(submissions[index]);
                                              ref.read(studentAssignmentDetailsProvider.notifier).setAssignment(asg);
                                              context.push(AppPages.assignmentDetailsStudent.toPath);
                                            },
                                            color: kDark,
                                          ),
                                        ),
                                        Flexible(
                                          child: Align(
                                            alignment: AlignmentDirectional.centerStart,
                                            child: AutoSizeText(
                                              'assignments.attempts'.tr(),
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
                                              '${submissions[index].attempts ?? 0}/${submissions[index].maxAttempts ?? '-'}',
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: kBlue,
                                                fontWeight: FontWeight.bold,
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
                                    Row(
                                      children: [
                                        appSizeBoxW15,
                                        Flexible(
                                          child: Align(
                                            alignment: AlignmentDirectional.centerStart,
                                            child: AutoSizeText(
                                              'assignments.deadline'.tr(),
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
                                              submissions[index].deadline == null
                                                  ? '-'
                                                  : DateFormat('dd MMM yyyy | h:mm a').format(submissions[index].deadline!),
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
                                              'assignments.lastSubmission'.tr(),
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
                                              submissions[index].lastSubmissionDate == null
                                                  ? '-'
                                                  : DateFormat('dd MMM yyyy | h:mm a').format(submissions[index].lastSubmissionDate!),
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
                    numberPages: ref.watch(pageManagerProvider.notifier).getPagesCount(prePagingsubmissions),
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

StudentAssignment getStudentAssignmentObject(StudentSubmission studentSubmission) {
  return StudentAssignment(
    id: studentSubmission.id,
    title: studentSubmission.title,
    description: studentSubmission.description,
    attachments: studentSubmission.attachments,
    attempts: studentSubmission.attempts,
    className: studentSubmission.courseTitle,
    deadline: studentSubmission.deadline!,
    grade: studentSubmission.grade,
    maxAttempts: studentSubmission.maxAttempts,
    maxGrade: studentSubmission.maxGrade,
    minGrade: studentSubmission.minGrade,
    courseName: studentSubmission.courseTitle,
    firstSubmission: studentSubmission.lastSubmissionDate,
    lastSubmission: studentSubmission.lastSubmissionDate,
    status: studentSubmission.studentStatus,
  );
}
