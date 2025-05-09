import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/evaluation.dart';
import '../entities/evaluation_details.dart';
import '../entities/evaluations_data.dart';

abstract class EvaluationRepository {
  //student
  Future<Either<Failure, EvaluationData>> getEvaluations();

  //teacher
  Future<Either<Failure, EvaluationDetails>> getEvaluationDetails(MonthlyEvaluation evaluation);
}
