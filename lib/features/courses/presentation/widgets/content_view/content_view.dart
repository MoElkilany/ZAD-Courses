import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_progress_indicators.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/types/app_types.dart';
import '../../../../../core/widgets/error/error_page.dart';
import '../../../domain/entities/course.dart';
import '../../providers/course.dart';
import 'content_row.dart';

class ContentTabBarView extends ConsumerStatefulWidget {
  const ContentTabBarView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContentTabBarViewState();
}

class _ContentTabBarViewState extends ConsumerState<ContentTabBarView> {
  final _scrollController = ScrollController(initialScrollOffset: 0);

  @override
  Widget build(BuildContext context) {
    AsyncValue<Either<Failure, Course>> course = ref.watch(
      getCourseProvider,
    );
    return RefreshIndicator(
      onRefresh: () async {
        ref.read(refreshCourseProvider);
      },
      color: kWhite,
      backgroundColor: kSecondary,
      child: course.when(
        skipLoadingOnRefresh: false,
        loading: () => const Center(
          child: appDefaultCircIndicator,
        ),
        error: (error, stack) => Center(
          child: Text(
            error.toString(),
          ),
        ),
        data: (data) {
          final course = data.fold((l) => null, (r) => r);
          if (course == null) {
            // ref.read(refreshCourseProvider);
            return Center(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ErrorPage(
                  errorMessage: 'learning.courseNotFound'.tr(),
                ),
              ),
            );
          }

          final chapters = course.courseContents;
          return Scrollbar(
            controller: _scrollController,
            thumbVisibility: true,
            child: Padding(
              padding: appPaddingSymH4,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: _scrollController,
                itemCount: chapters.length,
                itemBuilder: (context, index) {
                  final chapter = chapters[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      top: index == 0 ? 0 : 10,
                      bottom: 10,
                      right: 5,
                      left: 5,
                    ),
                    child: ExpansionTile(
                      shape: const RoundedRectangleBorder(
                        borderRadius: appBordRadCir8,
                        side: BorderSide(
                          color: kSecondary,
                          width: 2,
                        ),
                      ),
                      collapsedShape: const RoundedRectangleBorder(
                        borderRadius: appBordRadCir8,
                      ),
                      collapsedIconColor: kWhite,
                      iconColor: kDark,
                      collapsedTextColor: kWhite,
                      textColor: kSecondary,
                      collapsedBackgroundColor: kSecondary,
                      title: Text(
                        chapter.title,
                      ),
                      children: [
                        Container(
                          padding: appPaddingAll8,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              chapter.sessions.isEmpty
                                  ? const SizedBox.shrink()
                                  : Text(
                                      'learning.liveSessions'.tr(),
                                      style: const TextStyle(
                                        color: kDark,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                              chapter.sessions.isEmpty
                                  ? const SizedBox.shrink()
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: chapter.sessions.length,
                                      itemBuilder: (context, index) {
                                        final session = chapter.sessions[index];
                                        return ContentRow(
                                          contentType: ContentType.liveSession,
                                          text: session.title,
                                          url: session.url,
                                          sessionId: session.id,
                                        );
                                      },
                                    ),
                              chapter.files.isEmpty
                                  ? const SizedBox.shrink()
                                  : Text(
                                      'learning.files'.tr(),
                                      style: const TextStyle(
                                        color: kDark,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                              chapter.files.isEmpty
                                  ? const SizedBox.shrink()
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: chapter.files.length,
                                      itemBuilder: (context, index) {
                                        final file = chapter.files[index];
                                        return ContentRow(
                                          contentType: file.fileType != 'video' ? ContentType.files : ContentType.video,
                                          text: file.title,
                                          url: file.url,
                                        );
                                      },
                                    ),
                              chapter.texts.isEmpty
                                  ? const SizedBox.shrink()
                                  : Text(
                                      'learning.courseTexts'.tr(),
                                      style: const TextStyle(
                                        color: kDark,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                              chapter.texts.isEmpty
                                  ? const SizedBox.shrink()
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: chapter.texts.length,
                                      itemBuilder: (context, index) {
                                        final text = chapter.texts[index];
                                        return ContentRow(
                                          contentType: ContentType.text,
                                          text: text.title,
                                          url: text.url,
                                          summary: text.summary,
                                          textLessonImage: text.image,
                                        );
                                      },
                                    ),
                              chapter.assignments.isEmpty
                                  ? const SizedBox.shrink()
                                  : Text(
                                      'learning.assignments'.tr(),
                                      style: const TextStyle(
                                        color: kDark,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                              chapter.assignments.isEmpty
                                  ? const SizedBox.shrink()
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: chapter.assignments.length,
                                      itemBuilder: (context, index) {
                                        final asg = chapter.assignments[index];
                                        return ContentRow(
                                          contentType: ContentType.assignments,
                                          assignmentId: asg.id,
                                          text: asg.title,
                                          asgStatus: asg.status == 'completed'
                                              ? LearningAssignmentStatus.done
                                              : asg.status == 'pending'
                                                  ? LearningAssignmentStatus.pending
                                                  : LearningAssignmentStatus.missing,
                                        );
                                      },
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
