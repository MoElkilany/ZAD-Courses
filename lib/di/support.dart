import 'package:riverpod/riverpod.dart';

import '../core/platform/network_info.dart';
import '../features/support/data/data_sources/ticket_remote_data_source.dart';
import '../features/support/data/repositories/ticket_repository_impl.dart';
import '../features/support/domain/repositories/ticket_repository.dart';
import '../features/support/domain/usecases/get_academic_support_history.dart';
import '../features/support/domain/usecases/get_new_ticket_options.dart';
import '../features/support/domain/usecases/get_platform_support_history.dart';
import '../features/support/domain/usecases/submit_ticket.dart';
import 'external_services.dart';

class SupportDI {
  static final remoteDataSource = Provider<TicketRemoteDataSource>((ref) {
    final dio = ref.read(ExternalServices.dio);
    return TicketRemoteDataSourceImpl(
      dio,
    );
  });

  ///////////////////////////////\
  /// data repository  //////////\\
  ///////////////////////////////\\\
  static final ticketReposiroty = Provider<TicketRepository>((ref) {
    final remote = ref.read(remoteDataSource);
    final ninfo = ref.read(networkInfo);

    return TicketRepositoryImpl(
      remoteDataSource: remote,
      networkInfo: ninfo,
    );
  });
  ///////////////////////////////\
  /// usecases     //////////////\\
  ///////////////////////////////\\\
  static final submitNewTicket = Provider<SubmitNewTicket>((ref) {
    final repo = ref.watch(ticketReposiroty);
    return SubmitNewTicket(
      repository: repo,
    );
  });

  static final getNewTicketOptions = Provider<GetNewTicketOptions>((ref) {
    final repo = ref.watch(ticketReposiroty);
    return GetNewTicketOptions(
      repository: repo,
    );
  });

  static final getAcademicSupportHistory = Provider<GetAcademicSupportHistory>(
    (ref) {
      final repo = ref.watch(ticketReposiroty);
      return GetAcademicSupportHistory(
        repository: repo,
      );
    },
  );

  static final getPlatformSupportHistory = Provider<GetplatformSupportHistory>(
    (ref) {
      final repo = ref.watch(ticketReposiroty);
      return GetplatformSupportHistory(
        repository: repo,
      );
    },
  );
}
