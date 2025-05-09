import 'package:hive/hive.dart';
import 'package:riverpod/riverpod.dart';
import '../core/platform/network_info.dart';
import 'external_services.dart';
import '../features/courses/data/data_sources/course_local_data_source.dart';
import '../features/courses/data/data_sources/course_remote_data_source.dart';
import '../features/courses/data/repositories/course_repository_impl.dart';
import '../features/courses/domain/repositories/course_repository.dart';

class CoursesDI {
  static Future<List<Override>> init() async {
    return [
      CoursesDI.localDataSource.overrideWithValue(
        await CoursesDI.initLocalDataSource(),
      ),
    ];
  }

  static final localDataSource = Provider<CourseLocalDataSource>((ref) {
    throw UnimplementedError();
  });
  static Future<CourseLocalDataSourceImpl> initLocalDataSource() async {
    final learningBox = await Hive.openBox(
      CourseLocalDataSourceImpl.learningBoxName,
    );
    return CourseLocalDataSourceImpl(learningBox);
  }

  static final remoteDataSource = Provider<CourseRemoteDataSource>((ref) {
    final dio = ref.read(ExternalServices.dio);
    return CourseRemoteDataSourceImpl(dio, ref: ref);
  });

  static final courseRepository = Provider<CourseRepository>((ref) {
    final local = ref.watch(localDataSource);
    final remote = ref.read(remoteDataSource);
    final ninfo = ref.read(networkInfo);

    return CourseRepositoryImpl(
      localDataSource: local,
      remoteDataSource: remote,
      networkInfo: ninfo,
    );
  });
}
