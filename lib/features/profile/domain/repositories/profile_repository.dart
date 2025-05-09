import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/profile_info_response.dart';
import '../entities/update_image_request.dart';
import '../entities/update_image_response.dart';
import '../entities/update_password_request.dart';
import '../entities/update_password_response.dart';
import '../entities/update_profile_request.dart';
import '../entities/update_profile_response.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileInfoResponse>> getProfileInfo();
  Future<Either<Failure, UpdateImageResponse>> updateImage(
      UpdateImageRequest updateImageRequest);
  Future<Either<Failure, UpdatePasswordResponse>> updatePassword(
      UpdatePasswordRequest updatePasswordRequest);
  Future<Either<Failure, UpdateProfileResponse>> updateProfile(
      UpdateProfileRequest updateProfileRequest);
}
