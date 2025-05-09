import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../../../../di/evaluations.dart';
import '../../domain/entities/course.dart';
import '../../domain/entities/evaluation.dart';
import '../../domain/entities/evaluation_details.dart';
import '../../domain/entities/evaluations_data.dart';
import 'evaluations_filter.dart';

part 'evaluation_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Either<Failure, EvaluationData>> evaluationsData(Ref ref) async {
  final getEvaluations = ref.read(EvaluationsDI.getEvaluations);

  return await getEvaluations(NoParameters());
}

@Riverpod(keepAlive: true)
Future<Either<Failure, List<MonthlyEvaluation>>> evaluations(Ref ref) async {
  final data = await ref.watch(evaluationsDataProvider.future);
  return data.map((r) => r.evaluations);
}

@Riverpod(keepAlive: true)
Future<Either<Failure, List<Course>>> courses(Ref ref) async {
  final data = await ref.watch(evaluationsDataProvider.future);
  return data.map((r) => r.courses);
}

@riverpod
Future<Either<Failure, List<MonthlyEvaluation>>> filteredEvaluations(Ref ref) async {
  final all = await ref.watch(evaluationsProvider.future);
  final date = ref.watch(evaluationsDateFilterProvider);
  final month = ref.watch(evaluationsMonthFilterProvider);
  final course = ref.watch(evaluationsCourseFilterProvider);
  final formatter = DateFormat.MMM();
  return all.map((r) => r.where((e) {
        bool res = true;
        if (course != null) res = res & (e.courseId == course);
        if (date != null) res = res & (date.difference(e.createdAt).inDays < 1);
        if (month != null) res = res & (formatter.format(e.createdAt).toLowerCase().contains(month.toLowerCase()));
        return res;
      }).toList());
}

@riverpod
Future<Either<Failure, EvaluationDetails>> evaluationDetails(
  Ref ref,
  MonthlyEvaluation e,
) async {
  final getEvaluationDetails = ref.read(EvaluationsDI.getEvaluationDetails);
  final res = await getEvaluationDetails(e);
  return res;
}
