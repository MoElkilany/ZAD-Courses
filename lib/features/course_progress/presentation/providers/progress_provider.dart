import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../../../../di/progress.dart';
import '../../domain/entities/filters.dart';
import '../../domain/entities/progress.dart';
import '../../domain/entities/progress_req.dart';
import 'filters_provider.dart';

part 'progress_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Either<Failure, Progress?>> progressData(Ref ref) async {
  final getProgress = ref.read(ProgressDI.getProgresss);
  final course = ref.watch(progressCourseFilterProvider);
  final student = ref.watch(progressStudentFilterProvider);
  if (course != null && student != null) {
    return await getProgress(ProgressReq(course: course, student: student));
  } else {
    return Right(null);
  }
}

@Riverpod(keepAlive: true)
Future<Either<Failure, Filters>> filters(Ref ref) async {
  final getFitlers = ref.watch(ProgressDI.getFilters);
  return await getFitlers(NoParameters());
}
