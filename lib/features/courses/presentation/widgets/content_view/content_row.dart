import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oktoast/oktoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_progress_indicators.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/types/app_types.dart';
import '../../../../app_parent/presentation/providers/app_parent_states.dart';
import '../../../../assignments/domain/entities/student_assignment.dart';
import '../../../../assignments/domain/entities/student_submissions.dart';
import '../../../../assignments/presentation/providers/assignment_details.dart';
import '../../../../assignments/presentation/providers/assignments.dart';
import '../../providers/content_provider.dart';
import '../../providers/zoom_provider.dart';
import '../../../../../router/router_utils.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class ContentRow extends ConsumerStatefulWidget {
  const ContentRow({
    super.key,
    required this.contentType,
    required this.text,
    this.asgStatus,
    this.url,
    this.sessionId,
    this.summary,
    this.textLessonImage,
    this.assignmentId,
  });

  final ContentType contentType;
  final String text;
  final String? summary;
  final LearningAssignmentStatus? asgStatus;
  final String? url;
  final int? sessionId;
  final String? textLessonImage;
  final int? assignmentId;

  @override
  ConsumerState<ContentRow> createState() => _ContentRowState();
}

class _ContentRowState extends ConsumerState<ContentRow> {
  @override
  Widget build(BuildContext context) {
    var contentUrl = widget.url;
    // make sure its a valid url starting with http or https,
    //if not then add https:// to it
    if (widget.url != null && widget.url!.isNotEmpty && !widget.url!.startsWith('http') && !widget.url!.startsWith('https')) {
      contentUrl = 'https://${widget.url}';
    }
    final uri = widget.url != null && widget.url!.isNotEmpty && widget.contentType != ContentType.text ? Uri.parse(contentUrl!) : null;
    Future<bool> permissionHandler() async {
      if (!await Permission.camera.status.isGranted) {
        await Permission.camera.request();
      }
      if (!await Permission.microphone.status.isGranted) {
        await Permission.microphone.request();
      }
      return await Permission.camera.status.isGranted && await Permission.microphone.status.isGranted;
    }

    Future<void> launchUrlOnTap() async {
      if (widget.contentType == ContentType.text) {
        //Alert Dialog to show the notification Title and Message
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => AlertDialog(
            contentPadding: appPaddingSymH20,
            titlePadding: appPaddingAll16,
            actionsPadding: appPaddingAll4,
            title: Row(
              children: [
                Text(
                  widget.text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: kSecondary,
                    fontSize: appFontSizeVeryLarge,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: kDark,
                  ),
                ),
              ],
            ),
            content: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              //msg is html text, use rich text to show it
              child: Column(
                children: [
                  if (widget.textLessonImage != null && widget.textLessonImage!.isNotEmpty)
                    Image.network(
                      widget.textLessonImage!,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return appDefaultCircIndicator;
                      },
                    ),
                  Text(
                    'learning.text.content'.tr(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: kGray,
                      fontSize: appFontSizeVeryLarge,
                    ),
                  ),
                  HtmlWidget(
                    // the first parameter (`html`) is required
                    widget.url ?? '',
                    renderMode: RenderMode.column,
                    // set the default styling for text
                    textStyle: TextStyle(
                      color: kGray.withOpacity(0.8),
                      fontSize: appFontSizeLarge,
                    ),
                  ),
                  if (widget.summary != null && widget.summary!.isNotEmpty)
                    Column(
                      children: [
                        Text(
                          'learning.text.summary'.tr(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: kGray,
                            fontSize: appFontSizeVeryLarge,
                          ),
                        ),
                        appBoxH8,
                        HtmlWidget(
                          widget.summary!,
                          textStyle: TextStyle(
                            color: kGray.withOpacity(0.8),
                            fontSize: appFontSizeLarge,
                          ),
                        ),
                        appSizeBoxH02,
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
        return;
      }

      if (widget.contentType == ContentType.assignments && widget.assignmentId != null) {
        final isTeacher = ref.read(AppParentStates.appUserInfo.notifier).state!.isTeacher();

        if (isTeacher) {
          context.push(AppPages.assignments.toPath);
          return;
        }
        final assignmentAsync = ref.read(getStudentAssignmentsProvider).value;
        if (assignmentAsync == null) {
          return;
        }
        final assignment = assignmentAsync.fold((l) => null, (r) => r);
        if (assignment == null) {
          return;
        }

        ref
            .read(studentAssignmentDetailsProvider.notifier)
            .setAssignment(assignment.assignments.firstWhere((element) => element.id == widget.assignmentId));
        context.push(AppPages.assignmentDetailsStudent.toPath);
        return;
      }

      //if uri is null, return
      if (uri == null) {
        return;
      }

      //if live session , go to zoom page
      if (widget.contentType == ContentType.liveSession) {
        if (widget.sessionId == null) {
          return;
        }
        await permissionHandler().then((value) {
          final wasGranted = value;
          log(wasGranted.toString());
          if (wasGranted) {
            ref.read(sessionIdProvider.notifier).setId(widget.sessionId!);
            if (!mounted) return;
            // ignore: use_build_context_synchronously
            context.push(AppPages.zoom.toPath);
          } else {
            //toast error
            showToast('courses.pleaseGrantPermission'.tr());
          }
        });
        return;
      }

      if (!await launchUrl(
        uri,
        mode: widget.contentType != ContentType.text ? LaunchMode.externalApplication : LaunchMode.inAppWebView,
      )) {
        throw Exception('Could not launch $uri');
      }
    }

    return InkWell(
      onTap: () => uri == null && widget.contentType != ContentType.text && widget.contentType != ContentType.assignments ? null : launchUrlOnTap(),
      child: Padding(
        padding: appPaddingAll8,
        child: Row(
          children: [
            appBoxW8,
            Icon(
              ref.watch(
                getContentIconDataProvider(contentType: widget.contentType),
              ),
              color: kSecondary,
            ),
            appBoxW4,
            Expanded(
              child: AutoSizeText(
                widget.text,
                maxLines: 1,
                style: const TextStyle(
                  color: kSecondary,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            appBoxW8,
          ],
        ),
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
