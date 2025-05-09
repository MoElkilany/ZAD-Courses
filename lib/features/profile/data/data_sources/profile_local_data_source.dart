import '../../domain/entities/profile_info_response.dart';

abstract class ProfileLocalDataSource {
  static const profileBox = 'profile_box';
  static const profileInfo = 'profile_info';
  ProfileInfoResponse getProfileInfo();
}
