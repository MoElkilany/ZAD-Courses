import 'package:riverpod/riverpod.dart';
import '../core/platform/network_info.dart';
import 'external_services.dart';
import '../features/dashboard/data/data_sources/dashboard_remote_data_source.dart';
import '../features/dashboard/data/repositories/dashboard_repository_impl.dart';
import '../features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardDI {
  static final remoteDataSource = Provider<DashboardRemoteDataSource>((ref) {
    final dio = ref.read(ExternalServices.dio);
    return DashboardRemoteDataSourceImpl(dio);
  });

  static final dashboardRepository = Provider<DashboardRepository>((ref) {
    final remote = ref.read(remoteDataSource);
    final ninfo = ref.read(networkInfo);

    return DashboardRepositoryImpl(
      remoteDataSource: remote,
      networkInfo: ninfo,
    );
  });
}
