import 'package:riverpod/riverpod.dart';

import '../core/platform/network_info.dart';
import '../features/course_progress/data/data_sources/progress_remote_data_source.dart';
import '../features/course_progress/data/repositories/progress_repository_impl.dart';
import '../features/course_progress/domain/repositories/progress_repository.dart';
import '../features/course_progress/domain/usecases/get_filters.dart';
import '../features/course_progress/domain/usecases/get_progress.dart';
import 'external_services.dart';

class ProgressDI {
  static final remoteDataSource = Provider<ProgressRemoteDataSource>((ref) {
    final dio = ref.read(ExternalServices.dio);
    return ProgressRemoteDataSourceImpl(dio);
  });

  static final progressRepository = Provider<ProgressRepository>((ref) {
    final remote = ref.read(remoteDataSource);
    final ninfo = ref.read(networkInfo);

    return ProgressRepositoryImpl(
      remoteDataSource: remote,
      networkInfo: ninfo,
    );
  });

  static final getProgresss = Provider<GetProgress>((ref) {
    final repo = ref.watch(progressRepository);
    return GetProgress(
      repository: repo,
    );
  });

  static final getFilters = Provider<GetFilters>((ref) {
    final repo = ref.watch(progressRepository);
    return GetFilters(
      repository: repo,
    );
  });
}
