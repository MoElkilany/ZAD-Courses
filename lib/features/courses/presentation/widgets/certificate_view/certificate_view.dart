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
import 'certificate_row.dart';

class CertificateTabBarView extends ConsumerWidget {
  const CertificateTabBarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final uri = Uri.parse('https://pub.dev/');

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
          final certificate = course.certificate;
          if (certificate.url == '') {
            return Stack(
              children: [
                ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    Center(
                      child: Text('learning.certificateNotFound'.tr(),
                          style: const TextStyle(
                            color: kGray,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              ],
            );
          }
          return Stack(
            children: [
              ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [CertificateRow(certificate: certificate)],
              ),
            ],
          );
        },
      ),
    );
  }
}
