import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/app_padding.dart';
import '../../../../core/config/app_progress_indicators.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/widgets/error/error_page.dart';
import '../../../app_parent/presentation/providers/app_parent_states.dart';
import '../providers/financial_data.dart';
import '../../../financial/presentation/widgets/financial_header.dart';
import '../../../financial/presentation/widgets/financial_list.dart';
import '../../../financial/presentation/widgets/financial_search_and_filters.dart';

class FinancialBody extends ConsumerWidget {
  const FinancialBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTeacher = ref.watch(AppParentStates.appUserInfo)!.isTeacher();

    final finProvider = isTeacher ? ref.watch(getFinancialDataTeacherProvider) : ref.watch(getFinancialDataStudentProvider);

    return RefreshIndicator(
      onRefresh: () async {
        if (isTeacher) {
          ref.invalidate(getFinancialDataTeacherProvider);
        } else {
          ref.invalidate(getFinancialDataStudentProvider);
        }
      },
      color: kWhite,
      backgroundColor: kSecondary,
      child: finProvider.when(
        skipLoadingOnRefresh: false,
        data: (data) {
          final foldedData = data.fold(
            (l) => null,
            (r) => r,
          );

          if (foldedData == null) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ErrorPage(
                errorMessage: 'errors.serverError'.tr(),
                showRefresh: true,
              ),
            );
          }

          // final finDocs = (isTeacher ? (foldedData as FinancialDataTeacherModel).finDocs : (foldedData as FinancialDataStudentModel).finDocs);

          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: appPaddingSymmetricWidth02,
              child: const Column(
                children: [
                  FinancialHeader(),
                  FinancialSearchAndFilter(),
                  FinancialList(),
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          return ErrorPage(
            errorMessage: 'errors.serverError'.tr(),
            showRefresh: true,
          );
        },
        loading: () => appDefaultCircIndicator,
      ),
    );
  }
}
