import 'package:riverpod/riverpod.dart';

import '../core/platform/network_info.dart';
import '../features/quizzes/data/data_sources/quizzes_remote_data_source.dart';
import '../features/quizzes/data/repositories/quizzes_repository_impl.dart';
import '../features/quizzes/domain/repositories/quizzes_repository.dart';
import 'external_services.dart';

class QuizzesDI {
  static final remoteDataSource = Provider<QuizzesRemoteDataSource>((ref) {
    final dio = ref.read(ExternalServices.dio);
    return QuizzesRemoteDataSourceImpl(dio);
  });

  static final quizzesRepository = Provider<QuizzesRepository>((ref) {
    final remote = ref.read(remoteDataSource);
    final ninfo = ref.read(networkInfo);

    return QuizzesRepositoryImpl(
      remoteDataSource: remote,
      networkInfo: ninfo,
    );
  });
}
