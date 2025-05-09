import 'package:dartz/dartz.dart';
import '../entities/user_info.dart';
import '../repositories/app_settings_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class CacheUserInfo extends UseCase<void, UserInfo> {
  final SettingsRepository repository;

  CacheUserInfo(this.repository);

  @override
  Future<Either<Failure, void>> call(
    UserInfo params,
  ) async =>
      await repository.cacheUserInfo(params);
}
