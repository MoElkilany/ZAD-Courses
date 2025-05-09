import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/types/app_types.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../entities/academic_support_history.dart';
import '../entities/new_ticket_options.dart';
import '../entities/platform_support_history.dart';

/// This abstract class represents the Ticket Repository, which is responsible for submitting tickets.
///
/// The [submitTicket] method takes in a [subject], [message], [ticketType], and [attachments] and returns a [Future] of [Either] [Failure] and [void].
/// The [subject] parameter is a [String] representing the subject of the ticket.
/// The [message] parameter is a [String] representing the message of the ticket.
/// The [ticketType] parameter is a [TicketType] representing the type of the ticket.
/// The [attachments] parameter is a [List] of [String] representing the attachments of the ticket.
///
/// If the ticket is submitted successfully, the [Either] will contain [void].
/// If there is a failure during the submission process, the [Either] will contain a [Failure].
abstract class TicketRepository {
  Future<Either<Failure, bool>> submitTicket(
    String subject,
    String message,
    TicketType ticketType,
    int? courseId,
    int? roleId,
    int? departmentID,
    List<String> attachments,
  );

  Future<Either<Failure, NewTicketOptions>> getNewTicketOptions(NoParameters params);

  Future<Either<Failure, AcademicSupportHistory>> getAcademicSupportHistory(NoParameters params);

  Future<Either<Failure, PlatformSupportHistory>> getPlatformSupportHistory(NoParameters params);
}
