import 'package:dartz/dartz.dart';
import '../repositories/app_settings_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class MarkNotificationRead extends UseCase<bool, int> {
  final SettingsRepository repository;

  MarkNotificationRead(this.repository);

  @override
  Future<Either<Failure, bool>> call(
    int params,
  ) async =>
      await repository.markNotificationRead(params);
}
