import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/config/app_size.dart';
import '../../../domain/entities/teacher_assignment.dart';
import '../../providers/assignment_details.dart';
import '../../../../common/presentation/providers/pagination.dart';
import '../../../../common/presentation/widgets/paginator.dart';
import '../../../../../router/router_utils.dart';

class AssignmentListTeacher extends ConsumerStatefulWidget {
  const AssignmentListTeacher({
    super.key,
    required this.filteredAsgs,
  });
  final List<TeacherAssignment> filteredAsgs;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AssignmentListTeacherState();
}

class _AssignmentListTeacherState extends ConsumerState<AssignmentListTeacher> {
  @override
  Widget build(BuildContext context) {
    final asgList = ref.watch(pageManagerProvider.notifier).getPagedList(widget.filteredAsgs) as List<TeacherAssignment>;
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
              appSizeBoxW1,
              SizedBox(
                width: width * 0.35,
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: AutoSizeText(
                    'assignments.courseAssingments'.tr(),
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
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: asgList.length,
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
                                asgList[index].title,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: kSecondary,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                              ),
                              AutoSizeText(
                                asgList[index].courseTitle,
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
                          asgList[index].status == 'active' ? 'assignments.active'.tr() : 'assignments.expired'.tr(),
                          style: TextStyle(
                            color: asgList[index].status == 'active' ? kGreen : kRed,
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
                              ref.read(studentsAssignmentSubmissionsDetailsProvider.notifier).setAssignment(asgList[index].id);

                              context.push(AppPages.assignmentSubmissionDetails.toPath);
                            },
                            color: kDark,
                          ),
                        ),
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: AutoSizeText(
                              'assignments.submissions'.tr(),
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
                              asgList[index].numSubmissions.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: kBlue,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
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
                              'assignments.dueDate'.tr(),
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
                              asgList[index].dueDate == null ? '-' : asgList[index].dueDate!,
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
          numberPages: ref.watch(pageManagerProvider.notifier).getPagesCount(widget.filteredAsgs),
          onPageChange: (int index) {
            ref.read(pageManagerProvider.notifier).setPage(index + 1);
            setState(() {});
          },
        ),
      ],
    );
  }
}
