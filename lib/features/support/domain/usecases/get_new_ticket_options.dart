//submit ticket UseCase

import 'package:dartz/dartz.dart';
import 'package:zad_test/core/error/failures.dart';
import 'package:zad_test/core/usecase/no_parameters.dart';
import 'package:zad_test/core/usecase/usecase.dart';
import 'package:zad_test/features/support/domain/entities/new_ticket_options.dart';
import 'package:zad_test/features/support/domain/repositories/ticket_repository.dart';

class GetNewTicketOptions extends UseCase<NewTicketOptions, NoParameters> {
  final TicketRepository repository;

  GetNewTicketOptions({
    required this.repository,
  });

  @override
  Future<Either<Failure, NewTicketOptions>> call(NoParameters params) async {
    return await repository.getNewTicketOptions(params);
  }
}
