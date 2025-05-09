//submit ticket UseCase

import 'package:dartz/dartz.dart';
import 'package:zad_test/core/error/failures.dart';
import 'package:zad_test/core/usecase/usecase.dart';
import 'package:zad_test/features/support/domain/entities/ticket_request.dart';
import 'package:zad_test/features/support/domain/repositories/ticket_repository.dart';

/// A use case that submits a ticket request to the repository.
///
/// This use case takes in a [TicketRequest] object and submits it to the [TicketRepository]
/// to create a new ticket. It returns a [Failure] if the submission fails, otherwise it
/// returns [void].
class SubmitNewTicket extends UseCase<bool, TicketRequest> {
  final TicketRepository repository;

  SubmitNewTicket({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool>> call(TicketRequest params) async {
    return await repository.submitTicket(
        params.subject, params.message, params.ticketType, params.course, params.role, params.department, params.attachments);
  }
}
