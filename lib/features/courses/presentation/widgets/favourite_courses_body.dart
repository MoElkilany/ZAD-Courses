import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oktoast/oktoast.dart';
import '../../../../core/config/app_font_size.dart';
import '../../../../core/config/app_padding.dart';
import '../../../../core/config/app_progress_indicators.dart';
import '../../../../core/config/app_size.dart';
import '../../../../core/config/app_sized_box.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/widgets/error/error_page.dart';
import '../../../app_parent/presentation/providers/app_parent_states.dart';
import '../providers/course.dart';
import 'course_tiles/course_card.dart';
import '../../../../main.dart';

class FavouriteCoursesBody extends ConsumerStatefulWidget {
  const FavouriteCoursesBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavouriteCoursesBodyState();
}

class _FavouriteCoursesBodyState extends ConsumerState<FavouriteCoursesBody> {
  @override
  Widget build(BuildContext context) {
    final getFavouritedCourses = ref.watch(getFavouritedCoursesProvider);

    return OKToast(
      duration: const Duration(seconds: 2),
      position: ToastPosition.bottom,
      child: getFavouritedCourses.when(
        skipLoadingOnRefresh: false,
        data: (data) {
          final favouritedCourses = ref.watch(favouritedCourseListProvider);
          final isFailiure = data.fold((l) => true, (r) => false);
          final msg = data.fold((l) => l.message, (r) => '');
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(getFavouritedCoursesProvider);
            },
            color: kWhite,
            backgroundColor: kSecondary,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: isFailiure
                  ? Center(
                      child: Padding(
                        padding: appPaddingTHeight02,
                        child: SizedBox(
                          height: AppSize.height * 0.5,
                          child: ErrorPage(
                            errorMessage: msg == '' ? 'errors.serverError'.tr() : msg,
                            showRefresh: true,
                            onDesktopRefresh: () {
                              ref.invalidate(getFavouritedCoursesProvider);
                            },
                          ),
                        ),
                      ),
                    )
                  : favouritedCourses.isEmpty
                      ? SizedBox(
                          height: AppSize.height * 0.85,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'courses.noFavourites'.tr(),
                                  style: const TextStyle(
                                    fontSize: appFontSizeLarge,
                                    color: kDark,
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      ref.invalidate(getFavouritedCoursesProvider);
                                    },
                                    child: Text(
                                      'courses.refresh'.tr(),
                                      style: const TextStyle(
                                        fontSize: appFontSizeMedium,
                                        color: kGray,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appSizeBoxH01,
                            Padding(
                              padding: appPaddingDirecS8,
                              child: AutoSizeText(
                                'courses.favourites'.tr(),
                                style: const TextStyle(
                                  fontSize: appFontSizeHuge,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // appBoxH8,
                            isLandscape
                                ? GridView.builder(
                                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                      crossAxisSpacing: 0,
                                      mainAxisSpacing: 0,
                                      maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                                      childAspectRatio: MediaQuery.of(context).size.height * 1.3 < MediaQuery.of(context).size.width ? 1.3 : 0.8,
                                    ),
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: favouritedCourses.length,
                                    itemBuilder: (context, index) {
                                      return CourseCard(
                                        course: favouritedCourses[index],
                                        index: index,
                                        isFavPage: true,
                                        isPurchased: favouritedCourses[index].isPurchased,
                                        favCourse: favouritedCourses[index],
                                      );
                                    },
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: favouritedCourses.length,
                                    itemBuilder: (context, index) {
                                      return CourseCard(
                                        course: favouritedCourses[index],
                                        index: index,
                                        isFavPage: true,
                                        isPurchased: ref.read(AppParentStates.appUserInfo)!.id == favouritedCourses[index].instructorId
                                            ? true
                                            : favouritedCourses[index].isPurchased,
                                        favCourse: favouritedCourses[index],
                                      );
                                    },
                                  ),
                          ],
                        ),
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () {
          return const Center(
            child: appDefaultCircIndicator,
          );
        },
      ),
    );
  }
}
