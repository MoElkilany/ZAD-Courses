//submit ticket UseCase

import 'package:dartz/dartz.dart';
import 'package:zad_test/core/error/failures.dart';
import 'package:zad_test/core/usecase/usecase.dart';
import 'package:zad_test/features/course_progress/domain/entities/progress.dart';
import 'package:zad_test/features/course_progress/domain/entities/progress_req.dart';
import 'package:zad_test/features/course_progress/domain/repositories/progress_repository.dart';

class GetProgress extends UseCase<Progress, ProgressReq> {
  final ProgressRepository repository;

  GetProgress({
    required this.repository,
  });

  @override
  Future<Either<Failure, Progress>> call(ProgressReq params) async {
    return await repository.getProgress(params);
  }
}
