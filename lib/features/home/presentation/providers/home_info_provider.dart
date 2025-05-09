import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/usecase/no_parameters.dart';
import '../../domain/entities/home_info.dart';
import '../../domain/usecases/get_home_info.dart';
import 'home_info_state.dart';

part 'home_info_provider.g.dart';

@riverpod
Future<HomeInfoState> fetchHomeInformation(Ref ref) async {
  final usecase = ref.read(getHomeInformation);
  final res = await usecase(NoParameters());
  return res.fold<HomeInfoState>(
    (l) => HomeInfoState(
      hasError: true,
      errorMessage: l.message,
    ),
    (r) => HomeInfoState(
      hasError: false,
      homeInfo: HomeInformation(
        testmonials: r.testmonials,
        partners: r.partners,
      ),
    ),
  );
}
