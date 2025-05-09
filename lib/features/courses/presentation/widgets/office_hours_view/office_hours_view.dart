import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_progress_indicators.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/widgets/error/error_page.dart';
import '../../../domain/entities/course.dart';
import '../../providers/course.dart';
import '../../providers/office_hours_provider.dart';

class OfficeHoursTabBarView extends ConsumerStatefulWidget {
  const OfficeHoursTabBarView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OfficeHoursTabBarViewState();
}

class _OfficeHoursTabBarViewState extends ConsumerState<OfficeHoursTabBarView> {
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

            //get all sessions from each chapter into a larger list called courseSessions
            final courseOfficeHours = chapters.map((chapter) => chapter.officeHours).expand((officeHours) => officeHours).toList();
            return ListView.builder(
                itemCount: courseOfficeHours.length,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final session = courseOfficeHours[index];
                  final chNum = chapters.indexWhere((chapter) => chapter.officeHours.contains(session) == true) + 1;

                  return InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text(
                        session.title,
                        style: const TextStyle(
                          color: kSecondary,
                        ),
                      ),
                      subtitle: Text(
                        '${DateFormat.yMMMMd().add_jm().format(
                              session.date.toLocal(),
                            )} | ${'learning.chapter'.tr()}: $chNum',
                        style: const TextStyle(
                          color: kGray,
                        ),
                      ),
                      trailing: Text(
                        ref.watch(
                          getOfficeHoursTextProvider(status: session.status),
                        ),
                        style: TextStyle(
                          color: ref.watch(
                            getOfficeHoursColorProvider(status: session.status),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
