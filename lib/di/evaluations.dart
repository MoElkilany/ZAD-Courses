import 'package:riverpod/riverpod.dart';

import '../core/platform/network_info.dart';
import '../features/monthly_evaluation/data/data_sources/monthly_evaluation_remote_data_source.dart';
import '../features/monthly_evaluation/data/repositories/evaluation_repository_impl.dart';
import '../features/monthly_evaluation/domain/repositories/evaluation_repository.dart';
import '../features/monthly_evaluation/domain/usecases/get_evaluation_details.dart';
import '../features/monthly_evaluation/domain/usecases/get_evaluations.dart';
import 'external_services.dart';

class EvaluationsDI {
  static final remoteDataSource = Provider<MonthlyEvaluationRemoteDataSource>((ref) {
    final dio = ref.read(ExternalServices.dio);
    return MonthlyEvaluationRemoteDataSourceImpl(dio);
  });

  static final evaluationRepository = Provider<EvaluationRepository>((ref) {
    final remote = ref.read(remoteDataSource);
    final ninfo = ref.read(networkInfo);

    return EvaluationRepositoryImpl(
      remoteDataSource: remote,
      networkInfo: ninfo,
    );
  });

  static final getEvaluations = Provider<GetEvaluations>((ref) {
    final repo = ref.watch(evaluationRepository);
    return GetEvaluations(
      repository: repo,
    );
  });

  static final getEvaluationDetails = Provider<GetEvaluationDetails>((ref) {
    final repo = ref.watch(evaluationRepository);
    return GetEvaluationDetails(
      repository: repo,
    );
  });
}
