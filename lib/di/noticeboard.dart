import 'package:riverpod/riverpod.dart';
import '../core/platform/network_info.dart';
import 'external_services.dart';
import '../features/Noticeboard/data/data_sources/noticeboard_remote_data_source.dart';
import '../features/Noticeboard/data/repositories/noticeboard_repository_impl.dart';
import '../features/Noticeboard/domain/repositories/noticeboard_repository.dart';
import '../features/Noticeboard/domain/usecases/get_new_notice_options.dart';
import '../features/Noticeboard/domain/usecases/submit_noticet.dart';

class NoticeboardDI {
  static final remoteDataSource = Provider<NoticeboardRemoteDataSource>((ref) {
    final dio = ref.read(ExternalServices.dio);
    return NoticeboardRemoteDataSourceImpl(dio);
  });

  static final noticeboardRepository = Provider<NoticeboardRepository>((ref) {
    final remote = ref.read(remoteDataSource);
    final ninfo = ref.read(networkInfo);

    return NoticeboardRepositoryImpl(
      remoteDataSource: remote,
      networkInfo: ninfo,
    );
  });

  static final submitNewNotice = Provider<SubmitNewNotice>((ref) {
    final repo = ref.watch(noticeboardRepository);
    return SubmitNewNotice(
      repository: repo,
    );
  });

  static final getNewNoticeOptions = Provider<GetNewNoticeOptions>((ref) {
    final repo = ref.watch(noticeboardRepository);
    return GetNewNoticeOptions(
      repository: repo,
    );
  });
}
