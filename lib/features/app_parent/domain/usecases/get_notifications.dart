import 'package:dartz/dartz.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../entities/zad_notification.dart';
import '../repositories/app_settings_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class GetNotifications extends UseCase<List<ZadNotification>, NoParameters> {
  final SettingsRepository repository;

  GetNotifications(this.repository);

  @override
  Future<Either<Failure, List<ZadNotification>>> call(
    NoParameters params,
  ) async =>
      await repository.getNotifications();
}
