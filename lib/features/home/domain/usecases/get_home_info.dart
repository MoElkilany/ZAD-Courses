import 'package:dartz/dartz.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/home_info.dart';

final getHomeInformation = Provider<GetHomeInformation>((ref) {
  // final localDataSource = ref.watch(homeInformationRepository);
  return GetHomeInformation(
      // localDataSource,
      );
});

class GetHomeInformation implements UseCase<HomeInformation, NoParameters> {
  GetHomeInformation(
      // this._homeInformationRepository,
      );
  // final HomeInformationRepository _homeInformationRepository;

  @override
  Future<Either<Failure, HomeInformation>> call(NoParameters _) async => throw UnimplementedError();
  // await _homeInformationRepository.getHomeInformation();
}
