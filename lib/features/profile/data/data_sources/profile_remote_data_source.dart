import '../../domain/entities/profile_info_response.dart';
import '../../domain/entities/update_image_request.dart';
import '../../domain/entities/update_image_response.dart';
import '../../domain/entities/update_password_request.dart';
import '../../domain/entities/update_password_response.dart';
import '../../domain/entities/update_profile_request.dart';
import '../../domain/entities/update_profile_response.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileInfoResponse> getProfileInfo();
  Future<UpdateImageResponse> updateImage(
    UpdateImageRequest updateImageRequest,
  );
  Future<UpdatePasswordResponse> updatePassword(
    UpdatePasswordRequest updatePasswordRequest,
  );
  Future<UpdateProfileResponse> updateProfile(
    UpdateProfileRequest updateProfileRequest,
  );
}
