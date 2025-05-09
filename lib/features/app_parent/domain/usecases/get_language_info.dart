import 'package:dartz/dartz.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../entities/language.dart';
import '../repositories/app_settings_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class GetLanguage extends UseCase<Language, NoParameters> {
  final SettingsRepository repository;

  GetLanguage(this.repository);

  @override
  Future<Either<Failure, Language>> call(
    NoParameters params,
  ) async =>
      await repository.getLanguage();
}
