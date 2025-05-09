//submit ticket UseCase

import 'package:dartz/dartz.dart';
import 'package:zad_test/core/error/failures.dart';
import 'package:zad_test/core/usecase/no_parameters.dart';
import 'package:zad_test/core/usecase/usecase.dart';
import 'package:zad_test/features/monthly_evaluation/domain/repositories/evaluation_repository.dart';

import '../entities/evaluations_data.dart';

class GetEvaluations extends UseCase<EvaluationData, NoParameters> {
  final EvaluationRepository repository;

  GetEvaluations({
    required this.repository,
  });

  @override
  Future<Either<Failure, EvaluationData>> call(NoParameters params) async {
    return await repository.getEvaluations();
  }
}
