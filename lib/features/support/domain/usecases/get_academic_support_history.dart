import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/academic_support_history.dart';
import '../repositories/ticket_repository.dart';

/// A use case that retrieves a list of academic support tickets history.
class GetAcademicSupportHistory extends UseCase<AcademicSupportHistory, NoParameters> {
  final TicketRepository repository;

  GetAcademicSupportHistory({
    required this.repository,
  });

  @override
  Future<Either<Failure, AcademicSupportHistory>> call(NoParameters params) async {
    return await repository.getAcademicSupportHistory(params);
  }
}
