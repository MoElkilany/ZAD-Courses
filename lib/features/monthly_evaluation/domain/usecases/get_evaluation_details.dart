import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/evaluation.dart';
import '../entities/evaluation_details.dart';
import '../repositories/evaluation_repository.dart';

class GetEvaluationDetails extends UseCase<EvaluationDetails, MonthlyEvaluation> {
  final EvaluationRepository repository;

  GetEvaluationDetails({
    required this.repository,
  });

  @override
  Future<Either<Failure, EvaluationDetails>> call(MonthlyEvaluation params) async {
    return await repository.getEvaluationDetails(params);
  }
}
