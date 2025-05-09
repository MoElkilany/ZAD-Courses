import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/platform_support_history.dart';
import '../repositories/ticket_repository.dart';

/// A use case that retrieves a list of academic support tickets history.
class GetplatformSupportHistory extends UseCase<PlatformSupportHistory, NoParameters> {
  final TicketRepository repository;

  GetplatformSupportHistory({
    required this.repository,
  });

  @override
  Future<Either<Failure, PlatformSupportHistory>> call(NoParameters params) async {
    return await repository.getPlatformSupportHistory(params);
  }
}
