import 'package:equatable/equatable.dart';

import '../../../common/domain/entities/message_header.dart';

class ProfileInfoResponse extends Equatable {
  final MessageHeader messageHeader;

  final int id;
  final String fullName;
  final String roleName;
  final String? bio;
  final bool offline;
  final String? offlineMessage;
  final bool verified;
  final int rate;
  final String avatar;
  final String meetingStatus;
  final String? userGroup;
  final String? address;
  final String status;
  final String email;
  final String? mobile;
  final String language;
  final bool newsletter;
  final int publicMessage;
  final String? activeSubscription;
  final String? headline;
  final int coursesCount;
  final int reviewsCount;
  final int appointmentsCount;
  final int studentsCount;
  final int followersCount;
  final int followingCount;
  final List badges;
  final List students;
  final List followers;
  final List following;
  final bool authUserIsFollower;
  final String? referral;
  final List education;
  final List experience;
  final List occupations;
  final String? about;
  final List courses;
  final String? meeting;
  final List organizationTeachers;
  final String? countryId;
  final String? provinceId;
  final String? cityId;
  final String? districtId;
  final String? accountType;
  final String? iban;
  final String? accountId;
  final String? identityScan;
  final String? certificate;

  const ProfileInfoResponse({
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

  @override
  List<Object?> get props => [id];
}
