import 'package:dartz/dartz.dart';
import '../entities/auth_info.dart';
import '../repositories/app_settings_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class CacheAuthInfo extends UseCase<void, AuthInfo> {
  final SettingsRepository repository;

  CacheAuthInfo(this.repository);

  @override
  Future<Either<Failure, void>> call(
    AuthInfo params,
  ) async =>
      await repository.cacheAuthInfo(params);
}
