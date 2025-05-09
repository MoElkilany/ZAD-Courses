import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/update_password_request.dart';
import '../entities/update_password_response.dart';

class UpdatePassword
    extends UseCase<UpdatePasswordResponse, UpdatePasswordRequest> {
  @override
  Future<Either<Failure, UpdatePasswordResponse>> call(
      UpdatePasswordRequest params) {
    throw UnimplementedError();
  }
}
