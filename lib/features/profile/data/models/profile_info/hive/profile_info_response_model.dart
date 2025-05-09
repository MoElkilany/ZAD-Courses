import 'package:hive/hive.dart';

import '../../../../../common/domain/entities/message_header.dart';
import '../../../../domain/entities/profile_info_response.dart';

part 'profile_info_response_model.g.dart';

@HiveType(typeId: 1)
// ignore: must_be_immutable
class ProfileInfoResponseHiveModel extends HiveObject implements ProfileInfoResponse {
  @override
  @HiveField(0)
  final MessageHeader messageHeader;
  @override
  @HiveField(1)
  final int id;
  @override
  @HiveField(2)
  final String fullName;
  @override
  @HiveField(3)
  final String roleName;
  @override
  @HiveField(4)
  final String? bio;
  @override
  @HiveField(5)
  final bool offline;
  @override
  @HiveField(6)
  final String? offlineMessage;
  @override
  @HiveField(7)
  final bool verified;
  @override
  @HiveField(8)
  final int rate;
  @override
  @HiveField(9)
  final String avatar;
  @override
  @HiveField(10)
  final String meetingStatus;
  @override
  @HiveField(11)
  final String? userGroup;
  @override
  @HiveField(12)
  final String? address;
  @override
  @HiveField(13)
  final String status;
  @override
  @HiveField(14)
  final String email;
  @override
  @HiveField(15)
  final String? mobile;
  @override
  @HiveField(16)
  final String language;
  @override
  @HiveField(17)
  final bool newsletter;
  @override
  @HiveField(18)
  final int publicMessage;
  @override
  @HiveField(19)
  final String? activeSubscription;
  @override
  @HiveField(20)
  final String? headline;
  @override
  @HiveField(21)
  final int coursesCount;
  @override
  @HiveField(22)
  final int reviewsCount;
  @override
  @HiveField(23)
  final int appointmentsCount;
  @override
  @HiveField(24)
  final int studentsCount;
  @override
  @HiveField(25)
  final int followersCount;
  @override
  @HiveField(26)
  final int followingCount;
  @override
  @HiveField(27)
  final List badges;
  @override
  @HiveField(28)
  final List students;
  @override
  @HiveField(29)
  final List followers;
  @override
  @HiveField(30)
  final List following;
  @override
  @HiveField(31)
  final bool authUserIsFollower;
  @override
  @HiveField(32)
  final String? referral;
  @override
  @HiveField(33)
  final List education;
  @override
  @HiveField(34)
  final List experience;
  @override
  @HiveField(35)
  final List occupations;
  @override
  @HiveField(36)
  final String? about;
  @override
  @HiveField(37)
  final List courses;
  @override
  @HiveField(38)
  final String? meeting;
  @override
  @HiveField(39)
  final List organizationTeachers;
  @override
  @HiveField(40)
  final String? countryId;
  @override
  @HiveField(41)
  final String? provinceId;
  @override
  @HiveField(42)
  final String? cityId;
  @override
  @HiveField(43)
  final String? districtId;
  @override
  @HiveField(44)
  final String? accountType;
  @override
  @HiveField(45)
  final String? iban;
  @override
  @HiveField(46)
  final String? accountId;
  @override
  @HiveField(47)
  final String? identityScan;
  @override
  @HiveField(48)
  final String? certificate;

  ProfileInfoResponseHiveModel({
    required this.messageHeader,
    required this.id,
    required this.fullName,
    required this.roleName,
    required this.bio,
    required this.offline,
    required this.offlineMessage,
    required this.verified,
    required this.rate,
    required this.avatar,
    required this.meetingStatus,
    required this.userGroup,
    required this.address,
    required this.status,
    required this.email,
    required this.mobile,
    required this.language,
    required this.newsletter,
    required this.publicMessage,
    required this.activeSubscription,
    required this.headline,
    required this.coursesCount,
    required this.reviewsCount,
    required this.appointmentsCount,
    required this.studentsCount,
    required this.followersCount,
    required this.followingCount,
    required this.badges,
    required this.students,
    required this.followers,
    required this.following,
    required this.authUserIsFollower,
    required this.referral,
    required this.education,
    required this.experience,
    required this.occupations,
    required this.about,
    required this.courses,
    required this.meeting,
    required this.organizationTeachers,
    required this.countryId,
    required this.provinceId,
    required this.cityId,
    required this.districtId,
    required this.accountType,
    required this.iban,
    required this.accountId,
    required this.identityScan,
    required this.certificate,
  });
  factory ProfileInfoResponseHiveModel.of(ProfileInfoResponse profileInfoResponse) {
    return ProfileInfoResponseHiveModel(
      messageHeader: profileInfoResponse.messageHeader,
      id: profileInfoResponse.id,
      fullName: profileInfoResponse.fullName,
      roleName: profileInfoResponse.roleName,
      bio: profileInfoResponse.bio,
      offline: profileInfoResponse.offline,
      offlineMessage: profileInfoResponse.offlineMessage,
      verified: profileInfoResponse.verified,
      rate: profileInfoResponse.rate,
      avatar: profileInfoResponse.avatar,
      meetingStatus: profileInfoResponse.meetingStatus,
      userGroup: profileInfoResponse.userGroup,
      address: profileInfoResponse.address,
      status: profileInfoResponse.status,
      email: profileInfoResponse.email,
      mobile: profileInfoResponse.mobile,
      language: profileInfoResponse.language,
      newsletter: profileInfoResponse.newsletter,
      publicMessage: profileInfoResponse.publicMessage,
      activeSubscription: profileInfoResponse.activeSubscription,
      headline: profileInfoResponse.headline,
      coursesCount: profileInfoResponse.coursesCount,
      reviewsCount: profileInfoResponse.reviewsCount,
      appointmentsCount: profileInfoResponse.appointmentsCount,
      studentsCount: profileInfoResponse.studentsCount,
      followersCount: profileInfoResponse.followersCount,
      followingCount: profileInfoResponse.followingCount,
      badges: profileInfoResponse.badges,
      students: profileInfoResponse.students,
      followers: profileInfoResponse.followers,
      following: profileInfoResponse.following,
      authUserIsFollower: profileInfoResponse.authUserIsFollower,
      referral: profileInfoResponse.referral,
      education: profileInfoResponse.education,
      experience: profileInfoResponse.experience,
      occupations: profileInfoResponse.occupations,
      about: profileInfoResponse.about,
      courses: profileInfoResponse.courses,
      meeting: profileInfoResponse.meeting,
      organizationTeachers: profileInfoResponse.organizationTeachers,
      countryId: profileInfoResponse.countryId,
      provinceId: profileInfoResponse.provinceId,
      cityId: profileInfoResponse.cityId,
      districtId: profileInfoResponse.districtId,
      accountType: profileInfoResponse.accountType,
      iban: profileInfoResponse.iban,
      accountId: profileInfoResponse.accountId,
      identityScan: profileInfoResponse.identityScan,
      certificate: profileInfoResponse.certificate,
    );
  }

  @override
  List<Object?> get props => [id];

  @override
  bool? get stringify => true;
}
