import 'package:dartz/dartz.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../repositories/app_settings_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class ClearAuthInfo extends UseCase<void, NoParameters> {
  final SettingsRepository repository;

  ClearAuthInfo(this.repository);

  @override
  Future<Either<Failure, void>> call(
    NoParameters params,
  ) async =>
      await repository.clearAuthInfo();
}
