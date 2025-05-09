import 'package:riverpod/riverpod.dart';
import '../core/platform/network_info.dart';
import 'external_services.dart';
import '../features/Financial/data/data_sources/financial_remote_data_source.dart';
import '../features/Financial/data/repositories/financial_repository_impl.dart';
import '../features/Financial/domain/repositories/financial_repository.dart';

class FinancialDI {
  static final remoteDataSource = Provider<FinancialRemoteDataSource>((ref) {
    final dio = ref.read(ExternalServices.dio);
    return FinancialRemoteDataSourceImpl(dio);
  });

  static final financialRepository = Provider<FinancialRepository>((ref) {
    final remote = ref.read(remoteDataSource);
    final ninfo = ref.read(networkInfo);

    return FinancialRepositoryImpl(
      remoteDataSource: remote,
      networkInfo: ninfo,
    );
  });
}
