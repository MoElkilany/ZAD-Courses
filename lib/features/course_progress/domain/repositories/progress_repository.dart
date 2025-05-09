import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/filters.dart';
import '../entities/progress.dart';
import '../entities/progress_req.dart';

abstract class ProgressRepository {
  Future<Either<Failure, Progress>> getProgress(ProgressReq req);
  Future<Either<Failure, Filters>> getFilters();
}
