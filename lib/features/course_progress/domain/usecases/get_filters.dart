//submit ticket UseCase

import 'package:dartz/dartz.dart';
import 'package:zad_test/core/error/failures.dart';
import 'package:zad_test/core/usecase/no_parameters.dart';
import 'package:zad_test/core/usecase/usecase.dart';
import 'package:zad_test/features/course_progress/domain/entities/filters.dart';
import 'package:zad_test/features/course_progress/domain/repositories/progress_repository.dart';

class GetFilters extends UseCase<Filters, NoParameters> {
  final ProgressRepository repository;

  GetFilters({
    required this.repository,
  });

  @override
  Future<Either<Failure, Filters>> call(params) async {
    return await repository.getFilters();
  }
}
