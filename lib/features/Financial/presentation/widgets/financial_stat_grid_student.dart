import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/app_padding.dart';
import '../../../../core/config/app_progress_indicators.dart';
import '../../../../core/config/app_sized_box.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/types/app_types.dart';
import '../../../Financial/domain/entities/financial_data_student.dart';
import '../../../Financial/presentation/providers/financial_data.dart';
import 'financial_card.dart';

class FinancialStatGridStudent extends ConsumerWidget {
  const FinancialStatGridStudent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Either<Failure, FinancialDataStudent>> studentAsync = ref.watch(
      getFinancialDataStudentProvider,
    );
    return studentAsync.when(
      data: (data) {
        final foldedData = data.fold((l) => null, (r) => r);
        if (foldedData == null) {
          return Padding(
            padding: appPaddingSymV16,
            child: const Text('errors.responseError').tr(),
          );
        }
        return Column(
          children: [
            Row(
              children: [
                FinancialCard(
                  finType: FinancialCardType.balance,
                  num: foldedData.balance,
                ),
                FinancialCard(
                  finType: FinancialCardType.rechargeNum,
                  num: foldedData.numRecharge.toDouble(),
                ),
              ],
            ),
            Row(
              children: [
                FinancialCard(
                  finType: FinancialCardType.enrolledNum,
                  num: foldedData.numCourses.toDouble(),
                ),
                FinancialCard(
                  finType: FinancialCardType.installmens,
                  num: foldedData.numInstalments.toDouble(),
                ),
              ],
            ),
            appBoxH8,
          ],
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () {
        return const Center(child: appDefaultCircIndicator);
      },
    );
  }
}
