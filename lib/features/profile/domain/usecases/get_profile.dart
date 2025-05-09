import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/profile_info_response.dart';

class GetProfileInfo extends UseCase<ProfileInfoResponse, NoParameters> {
  @override
  Future<Either<Failure, ProfileInfoResponse>> call(NoParameters params) {
    throw UnimplementedError();
  }
}
