import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/update_profile_request.dart';
import '../entities/update_profile_response.dart';

class UpdateProfile
    extends UseCase<UpdateProfileResponse, UpdateProfileRequest> {
  @override
  Future<Either<Failure, UpdateProfileResponse>> call(
      UpdateProfileRequest params) {
    throw UnimplementedError();
  }
}
