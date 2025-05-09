import 'package:hive/hive.dart';
import 'package:riverpod/riverpod.dart';

import '../core/platform/network_info.dart';
import '../features/assignments/data/data_sources/assignments_local_data_source.dart';
import '../features/assignments/data/data_sources/assignments_remote_data_source.dart';
import '../features/assignments/data/repositories/assignment_repository_impl.dart';
import '../features/assignments/domain/repositories/assignments_repository.dart';
import 'external_services.dart';

class AssignmentsDI {
  static Future<List<Override>> init() async {
    return [
      AssignmentsDI.localDataSource.overrideWithValue(
        await AssignmentsDI.initLocalDataSource(),
      ),
    ];
  }

  static final localDataSource = Provider<AssignmentsLocalDataSource>((ref) {
    throw UnimplementedError();
  });
  static Future<AssignmentsLocalDataSource> initLocalDataSource() async {
    final assignmentsBox = await Hive.openBox(
      AssignmentsLocalDataSourceImpl.assignmentsBoxName,
    );
    return AssignmentsLocalDataSourceImpl(assignmentsBox);
  }

  static final remoteDataSource = Provider<AssignmentsRemoteDataSource>((ref) {
    final dio = ref.read(ExternalServices.dio);
    return AssignmentsRemoteDataSourceImpl(dio);
  });

  static final assignmentsRepository = Provider<AssignmentsRepository>((ref) {
    final local = ref.watch(localDataSource);
    final remote = ref.read(remoteDataSource);
    final ninfo = ref.read(networkInfo);

    return AssignmentsRepositoryImpl(
      localDataSource: local,
      remoteDataSource: remote,
      networkInfo: ninfo,
    );
  });
}
