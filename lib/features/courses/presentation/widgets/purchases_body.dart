import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oktoast/oktoast.dart';
import '../../../../core/config/app_font_size.dart';
import '../../../../core/config/app_padding.dart';
import '../../../../core/config/app_progress_indicators.dart';
import '../../../../core/config/app_sized_box.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/widgets/error/error_page.dart';
import '../../../app_parent/presentation/providers/app_parent_states.dart';
import '../providers/course.dart';
import 'course_tiles/course_card.dart';
import '../../../../main.dart';

class PurchasesBody extends ConsumerStatefulWidget {
  const PurchasesBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PurchasesBodyState();
}

class _PurchasesBodyState extends ConsumerState<PurchasesBody> {
  @override
  Widget build(BuildContext context) {
    final getpurchasedCourses = ref.watch(getPurchasedCoursesProvider);

    return OKToast(
      duration: const Duration(seconds: 2),
      position: ToastPosition.bottom,
      child: getpurchasedCourses.when(
        skipLoadingOnRefresh: false,
        data: (data) {
          final purchasedCourses = ref.watch(courseListProvider);
          final isFailiure = data.fold((l) => true, (r) => false);
          final msg = data.fold((l) => l.message, (r) => 'errors.serverError'.tr());
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(getPurchasedCoursesProvider);
            },
            color: kWhite,
            backgroundColor: kSecondary,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: isFailiure
                  ? SizedBox(
                      height: isLandscape ? MediaQuery.of(context).size.height * 0.65 : null,
                      child: Center(
                        child: ErrorPage(
                          errorMessage: msg,
                          showRefresh: true,
                          onDesktopRefresh: () {
                            ref.invalidate(getPurchasedCoursesProvider);
                          },
                        ),
                      ),
                    )
                  : purchasedCourses.isEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.85,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  ref.read(AppParentStates.appUserInfo)!.isTeacher() ? 'courses.noCourses'.tr() : 'courses.noPurchases'.tr(),
                                  style: const TextStyle(
                                    fontSize: appFontSizeLarge,
                                    color: kDark,
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      ref.invalidate(getPurchasedCoursesProvider);
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
                                ref.read(AppParentStates.appUserInfo)!.isTeacher() ? 'courses.myCourses'.tr() : 'courses.purchases'.tr(),
                                style: const TextStyle(
                                  fontSize: appFontSizeHuge,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // appBoxH8,

                            isLandscape
                                ? GridView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: purchasedCourses.length,
                                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                      crossAxisSpacing: 0,
                                      mainAxisSpacing: 0,
                                      maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                                      childAspectRatio: MediaQuery.of(context).size.height * 1.3 < MediaQuery.of(context).size.width ? 1.3 : 0.8,
                                    ),
                                    itemBuilder: (context, index) {
                                      return CourseCard(
                                        course: purchasedCourses[index],
                                        index: index,
                                      );
                                    },
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: purchasedCourses.length,
                                    itemBuilder: (context, index) {
                                      return CourseCard(
                                        course: purchasedCourses[index],
                                        index: index,
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
