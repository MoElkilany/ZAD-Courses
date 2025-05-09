import 'package:dartz/dartz.dart';
import '../entities/language.dart';
import '../repositories/app_settings_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class CacheLanguage extends UseCase<void, Language> {
  final SettingsRepository repository;

  CacheLanguage(this.repository);

  @override
  Future<Either<Failure, void>> call(
    Language params,
  ) async =>
      await repository.cacheLanguage(params);
}
