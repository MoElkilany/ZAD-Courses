import 'package:async_button/async_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_progress_indicators.dart';
import '../../../../../core/config/app_shadow.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../main.dart';
import '../../../domain/entities/purchase.dart';
import '../../providers/course.dart';

class CourseStatusRow extends ConsumerStatefulWidget {
  const CourseStatusRow({
    super.key,
    required this.index,
    this.isFavPage,
  });

  final int index;
  final bool? isFavPage;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CourseStatusRowState();
}

class _CourseStatusRowState extends ConsumerState<CourseStatusRow> {
  AsyncBtnStatesController btnStateController = AsyncBtnStatesController();
  @override
  Widget build(BuildContext context) {
    final PurchasedCourse course = (widget.isFavPage != null && widget.isFavPage!)
        ? ref.watch(favouritedCourseListProvider)[widget.index]
        : ref.watch(courseListProvider)[widget.index];

    final String classType = course.classType;
    final bool hasExpireDate = course.expireDate != null;
    final bool isFavorite = course.isFavorite;
    final String schoolType = course.schoolType;
    final String yearType = course.yearType;
    final String? expireDate = course.expireDate;
    final int courseId = course.id;

    return SizedBox(
      width: isLandscape ? MediaQuery.of(context).size.width * 0.5 - 8 : MediaQuery.of(context).size.width - 8,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: isLandscape ? MediaQuery.of(context).size.width * 0.4 : MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.025,
                child: Wrap(
                  runSpacing: appFontSizeTiny,
                  children: [
                    Container(
                      padding: appPaddingSymH8,
                      decoration: const BoxDecoration(
                        color: kBlue,
                        borderRadius: appBordRadCir8,
                      ),
                      child: Padding(
                        padding: appPaddingSymV4,
                        child: Text(
                          classType,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: appFontSizeCompact,
                          ),
                        ),
                      ),
                    ),
                    if (hasExpireDate) appSizeBoxW01,
                    if (hasExpireDate)
                      Container(
                        padding: appPaddingSymH8,
                        decoration: BoxDecoration(
                          color: DateTime.parse(expireDate!).isBefore(DateTime.now()) ? kZadRed : kZadOrange,
                          borderRadius: appBordRadCir8,
                        ),
                        child: Padding(
                          padding: appPaddingSymV4,
                          child: Text(
                            '${'courses.expireDate'.tr()} ${DateFormat('d MMM yyyy').format(
                              DateTime.parse(expireDate),
                            )}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: appFontSizeCompact,
                            ),
                          ),
                        ),
                      ),
                    appSizeBoxW01,
                    Container(
                      padding: appPaddingSymH8,
                      decoration: const BoxDecoration(
                        color: kBlue,
                        borderRadius: appBordRadCir8,
                      ),
                      child: Padding(
                        padding: appPaddingSymV4,
                        child: Text(
                          schoolType,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: appFontSizeCompact,
                          ),
                        ),
                      ),
                    ),
                    appSizeBoxW01,
                    Container(
                      padding: appPaddingSymH8,
                      decoration: const BoxDecoration(
                        color: kPrimary,
                        borderRadius: appBordRadCir8,
                      ),
                      child: Padding(
                        padding: appPaddingSymV4,
                        child: Text(
                          yearType,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: appFontSizeCompact,
                          ),
                        ),
                      ),
                    ),
                    appSizeBoxW01,
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: appPaddingDirecE16,
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: AsyncElevatedBtn(
                      asyncBtnStatesController: btnStateController,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: const CircleBorder(),
                        elevation: 0,
                      ),
                      onPressed: () async {
                        btnStateController.update(AsyncBtnState.loading);
                        final value = await ref.read(
                          toggleFavouriteProvider(
                            courseId: courseId,
                            context: context,
                            isFavourite: isFavorite,
                          ).future,
                        );
                        btnStateController.update(AsyncBtnState.idle);

                        //if false, donot update the state
                        if (!value) return;

                        //if true, update the state
                        if (widget.isFavPage != null && widget.isFavPage!) {
                          //if fav page, refresh page
                          ref.invalidate(getFavouritedCoursesProvider);
                          return;
                        }
                        //if not fav page, update the state
                        final newIsFavorite = !isFavorite;
                        final List<PurchasedCourse> oldList = ref.read(courseListProvider);
                        final List<PurchasedCourse> newList = oldList
                            .map((e) => e.id == courseId
                                ? e.copyWith(
                                    isFavorite: newIsFavorite,
                                    courseContents: e.courseContents,
                                    expireDate: e.expireDate,
                                    imageUrl: e.imageUrl,
                                    purchaseDate: e.purchaseDate,
                                  )
                                : e)
                            .toList();
                        ref.read(courseListProvider.notifier).setList(newList);
                      },
                      loadingStyleBuilder: (data) {
                        return AsyncBtnStateStyle(
                          widget: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                            width: MediaQuery.of(context).size.height * 0.03,
                            child: const Center(
                              child: appKWhiteCircIndicator,
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                        color: kWhite,
                        size: MediaQuery.of(context).size.height * 0.035,
                        shadows: appShadowKDark08,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              appSizeBoxW02,
            ],
          )
        ],
      ),
    );
  }
}
