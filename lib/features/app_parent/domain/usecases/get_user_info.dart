import 'package:dartz/dartz.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../entities/user_info.dart';
import '../repositories/app_settings_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class GetUserInfo extends UseCase<UserInfo, NoParameters> {
  final SettingsRepository repository;

  GetUserInfo(this.repository);

  @override
  Future<Either<Failure, UserInfo>> call(
    NoParameters params,
  ) async =>
      await repository.getUserInfo();
}
