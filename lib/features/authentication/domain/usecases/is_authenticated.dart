import 'package:dartz/dartz.dart';
import '../../../../core/usecase/no_parameters.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/authentication_repository.dart';

class IsAuthenticated implements UseCase<void, NoParameters> {
  IsAuthenticated({
    required this.authenticationReposiroty,
  });
  final AuthenticationReposiroty authenticationReposiroty;

  @override
  Future<Either<Failure, bool>> call(_) async {
    final logoutResponse = authenticationReposiroty.isAuthenticated();
    return logoutResponse;
  }
}
