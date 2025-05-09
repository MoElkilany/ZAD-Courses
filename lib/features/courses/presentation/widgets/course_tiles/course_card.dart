import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_progress_indicators.dart';
import '../../../../../core/config/app_shadow.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/config/paths.dart';
import '../../../domain/entities/favourited.dart';
import '../../../domain/entities/purchase.dart';
import '../../providers/course.dart';
import 'course_metadata_row.dart';
import 'course_status_row.dart';
import '../../../../../main.dart';
import '../../../../../router/router_utils.dart';

class CourseCard extends ConsumerStatefulWidget {
  const CourseCard({
    super.key,
    required this.course,
    required this.index,
    this.isPurchased,
    this.isFavPage,
    this.favCourse,
  });

  final PurchasedCourse course;
  final int index;
  final bool? isPurchased;
  final bool? isFavPage;
  final FavouritedCourse? favCourse;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CourseCardState();
}

class _CourseCardState extends ConsumerState<CourseCard> {
  @override
  Widget build(BuildContext context) {
    late final PurchasedCourse course;
    late final FavouritedCourse? favCourse;
    if (widget.isFavPage != null && widget.isFavPage == true && widget.favCourse != null) {
      favCourse = widget.favCourse;
      course = widget.course;
    } else {
      course = widget.course;
      favCourse = null;
    }

    final classTitle = course.classTitle;
    final classRating = course.rating;
    final classYear = course.classYear;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: isLandscape ? MediaQuery.of(context).size.height * 0.35 : MediaQuery.of(context).size.height * 0.3,
          child: Padding(
            padding: appPaddingTLR8,
            child: Stack(
              fit: StackFit.loose,
              children: [
                ClipRRect(
                  borderRadius: appBordRadTLR16,
                  child: course.imageUrl == null
                      ? Image.asset(
                          AppPaths.logo,
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) => Center(
                            child: Text(
                              error.toString(),
                            ),
                          ),
                        )
                      : Image.network(
                          course.imageUrl!,
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return const Center(
                              child: appKSecondaryCircIndicator,
                            );
                          },
                          errorBuilder: (context, error, stackTrace) => Center(
                            child: Text(
                              error.toString(),
                            ),
                          ),
                        ),
                ),
                Positioned.directional(
                  bottom: 0,
                  start: 0,
                  textDirection: Directionality.of(context),
                  child: CourseMetadataRow(
                    classTitle: classTitle,
                    classRating: classRating,
                    classYear: classYear,
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: kSecondary.withOpacity(0.4),
                    borderRadius: appBordRadTLR16,
                    highlightColor: kSecondary.withOpacity(0.2),
                    onTap: () {
                      if (widget.isFavPage == null || widget.isFavPage == false) {
                        final idProvider = ref.read(courseIdProvider.notifier);
                        idProvider.setId(course.id);
                        context.push(AppPages.learning.toPath);
                      }
                      if (widget.isFavPage == true) {
                        final idProvider = ref.read(courseIdProvider.notifier);
                        idProvider.setId(course.id);

                        //if the course is purchased, go to learning page,
                        //else launch course url for purchase
                        if (favCourse != null && widget.isPurchased != null && widget.isPurchased == true) {
                          context.push(AppPages.learning.toPath);
                        } else {
                          if (favCourse != null && favCourse.purchaseLink != null) {
                            final uri = Uri.parse(favCourse.purchaseLink!);
                            launchUrl(
                              uri,
                              mode: LaunchMode.inAppWebView,
                            );
                          } else {
                            return; //do nothing
                          }
                        }
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Positioned.directional(
                  top: MediaQuery.of(context).size.height * 0.01,
                  start: isLandscape ? MediaQuery.of(context).size.height * 0.01 : MediaQuery.of(context).size.height * 0.02,
                  textDirection: Directionality.of(context),
                  child: CourseStatusRow(
                    index: widget.index,
                    isFavPage: widget.isFavPage,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: appPaddingBLR8,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: appBordRadBLR16,
                      boxShadow: appShadowKgrey05,
                      color: kWhite,
                    ),
                    child: Row(
                      children: [
                        appSizeBoxW02,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              appSizeBoxH01,
                              AutoSizeText(
                                'courses.instructor'.tr(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: appFontSizeMedium,
                                  color: kGray,
                                ),
                              ),
                              appSizeBoxH01,
                              Expanded(
                                child: AutoSizeText(
                                  course.instructorName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: appFontSizeLarge,
                                    color: kSecondary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        appSizeBoxW02,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today_rounded,
                                    color: kSecondary,
                                    size: appFontSizeVeryLarge,
                                  ),
                                  appSizeBoxW01,
                                  AutoSizeText(
                                    DateFormat('d MMM yyyy').format(course.startDate),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: appFontSizeMedium,
                                      color: kSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            appSizeBoxH01,
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.access_time_rounded,
                                    color: kSecondary,
                                    size: appFontSizeVeryLarge,
                                  ),
                                  appSizeBoxW01,
                                  AutoSizeText(
                                    course.durationPerSession,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: appFontSizeMedium,
                                      color: kSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        appSizeBoxW02,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        appSizeBoxH01,
      ],
    );
  }
}
