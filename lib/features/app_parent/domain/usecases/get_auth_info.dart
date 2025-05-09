import 'package:dartz/dartz.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../entities/auth_info.dart';
import '../repositories/app_settings_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class GetAuthInfo extends UseCase<AuthInfo, NoParameters> {
  final SettingsRepository repository;

  GetAuthInfo(this.repository);

  @override
  Future<Either<Failure, AuthInfo>> call(
    NoParameters params,
  ) async =>
      await repository.getAuthInfo();
}
