import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/update_image_request.dart';
import '../entities/update_image_response.dart';

class UpdateImage extends UseCase<UpdateImageResponse, UpdateImageRequest> {
  @override
  Future<Either<Failure, UpdateImageResponse>> call(
    UpdateImageRequest params,
  ) {
    throw UnimplementedError();
  }
}
