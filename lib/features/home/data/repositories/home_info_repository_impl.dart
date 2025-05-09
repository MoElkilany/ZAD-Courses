import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/home_info.dart';
import '../../domain/repositories/home_info_repository.dart';
import '../data_sources/home_information_local_data_source.dart';
import '../data_sources/home_information_remote_data_source.dart';

// final homeInformationRepository = Provider<HomeInformationRepository>((ref) {
//   final localDataSource = ref.watch(homeInformationLocalDataSource);
//   final remoteDataSource = ref.read(homeInformationRemoteDataSource);
//   final ninfo = ref.read(networkInfo);
//   return HomeInformationRepositoryImpl(
//     homeInformationLocalDataSource: localDataSource,
//     homeInformationRemoteDataSource: remoteDataSource,
//     networkInfo: ninfo,
//   );
// });

class HomeInformationRepositoryImpl extends HomeInformationRepository {
  final HomeInformationRemoteDataSource homeInformationRemoteDataSource;
  final HomeInformationLocalDataSource homeInformationLocalDataSource;
  final NetworkInfo networkInfo;

  HomeInformationRepositoryImpl({
    required this.homeInformationRemoteDataSource,
    required this.homeInformationLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, HomeInformation>> getHomeInformation() async {
    if (networkInfo.isConnected) {
      await Future.delayed(const Duration(seconds: 2));
      try {
        final result = await homeInformationRemoteDataSource.getHomeInformation();
        await homeInformationLocalDataSource.cacheHomeInformation(result);
        return Right(result);
      } catch (e) {
        return Left(ServerFailure(
          status: 500,
          message: 'errors.serverError'.tr(),
        ));
      }
    } else {
      try {
        final result = await homeInformationLocalDataSource.getLastHomeInformation();
        return Right(result);
      } catch (e) {
        return const Left(
          CacheFailure(
            status: 404,
            message: 'no cached data',
          ),
        );
      }
    }
  }
}
