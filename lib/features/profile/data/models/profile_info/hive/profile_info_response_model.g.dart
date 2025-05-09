// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_info_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileInfoResponseHiveModelAdapter
    extends TypeAdapter<ProfileInfoResponseHiveModel> {
  @override
  final int typeId = 1;

  @override
  ProfileInfoResponseHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileInfoResponseHiveModel(
      messageHeader: fields[0] as MessageHeader,
      id: fields[1] as int,
      fullName: fields[2] as String,
      roleName: fields[3] as String,
      bio: fields[4] as String?,
      offline: fields[5] as bool,
      offlineMessage: fields[6] as String?,
      verified: fields[7] as bool,
      rate: fields[8] as int,
      avatar: fields[9] as String,
      meetingStatus: fields[10] as String,
      userGroup: fields[11] as String?,
      address: fields[12] as String?,
      status: fields[13] as String,
      email: fields[14] as String,
      mobile: fields[15] as String?,
      language: fields[16] as String,
      newsletter: fields[17] as bool,
      publicMessage: fields[18] as int,
      activeSubscription: fields[19] as String?,
      headline: fields[20] as String?,
      coursesCount: fields[21] as int,
      reviewsCount: fields[22] as int,
      appointmentsCount: fields[23] as int,
      studentsCount: fields[24] as int,
      followersCount: fields[25] as int,
      followingCount: fields[26] as int,
      badges: (fields[27] as List).cast<dynamic>(),
      students: (fields[28] as List).cast<dynamic>(),
      followers: (fields[29] as List).cast<dynamic>(),
      following: (fields[30] as List).cast<dynamic>(),
      authUserIsFollower: fields[31] as bool,
      referral: fields[32] as String?,
      education: (fields[33] as List).cast<dynamic>(),
      experience: (fields[34] as List).cast<dynamic>(),
      occupations: (fields[35] as List).cast<dynamic>(),
      about: fields[36] as String?,
      courses: (fields[37] as List).cast<dynamic>(),
      meeting: fields[38] as String?,
      organizationTeachers: (fields[39] as List).cast<dynamic>(),
      countryId: fields[40] as String?,
      provinceId: fields[41] as String?,
      cityId: fields[42] as String?,
      districtId: fields[43] as String?,
      accountType: fields[44] as String?,
      iban: fields[45] as String?,
      accountId: fields[46] as String?,
      identityScan: fields[47] as String?,
      certificate: fields[48] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileInfoResponseHiveModel obj) {
    writer
      ..writeByte(49)
      ..writeByte(0)
      ..write(obj.messageHeader)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(3)
      ..write(obj.roleName)
      ..writeByte(4)
      ..write(obj.bio)
      ..writeByte(5)
      ..write(obj.offline)
      ..writeByte(6)
      ..write(obj.offlineMessage)
      ..writeByte(7)
      ..write(obj.verified)
      ..writeByte(8)
      ..write(obj.rate)
      ..writeByte(9)
      ..write(obj.avatar)
      ..writeByte(10)
      ..write(obj.meetingStatus)
      ..writeByte(11)
      ..write(obj.userGroup)
      ..writeByte(12)
      ..write(obj.address)
      ..writeByte(13)
      ..write(obj.status)
      ..writeByte(14)
      ..write(obj.email)
      ..writeByte(15)
      ..write(obj.mobile)
      ..writeByte(16)
      ..write(obj.language)
      ..writeByte(17)
      ..write(obj.newsletter)
      ..writeByte(18)
      ..write(obj.publicMessage)
      ..writeByte(19)
      ..write(obj.activeSubscription)
      ..writeByte(20)
      ..write(obj.headline)
      ..writeByte(21)
      ..write(obj.coursesCount)
      ..writeByte(22)
      ..write(obj.reviewsCount)
      ..writeByte(23)
      ..write(obj.appointmentsCount)
      ..writeByte(24)
      ..write(obj.studentsCount)
      ..writeByte(25)
      ..write(obj.followersCount)
      ..writeByte(26)
      ..write(obj.followingCount)
      ..writeByte(27)
      ..write(obj.badges)
      ..writeByte(28)
      ..write(obj.students)
      ..writeByte(29)
      ..write(obj.followers)
      ..writeByte(30)
      ..write(obj.following)
      ..writeByte(31)
      ..write(obj.authUserIsFollower)
      ..writeByte(32)
      ..write(obj.referral)
      ..writeByte(33)
      ..write(obj.education)
      ..writeByte(34)
      ..write(obj.experience)
      ..writeByte(35)
      ..write(obj.occupations)
      ..writeByte(36)
      ..write(obj.about)
      ..writeByte(37)
      ..write(obj.courses)
      ..writeByte(38)
      ..write(obj.meeting)
      ..writeByte(39)
      ..write(obj.organizationTeachers)
      ..writeByte(40)
      ..write(obj.countryId)
      ..writeByte(41)
      ..write(obj.provinceId)
      ..writeByte(42)
      ..write(obj.cityId)
      ..writeByte(43)
      ..write(obj.districtId)
      ..writeByte(44)
      ..write(obj.accountType)
      ..writeByte(45)
      ..write(obj.iban)
      ..writeByte(46)
      ..write(obj.accountId)
      ..writeByte(47)
      ..write(obj.identityScan)
      ..writeByte(48)
      ..write(obj.certificate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileInfoResponseHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
