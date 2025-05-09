// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserInfoHiveModelAdapter extends TypeAdapter<UserInfoHiveModel> {
  @override
  final int typeId = 18;

  @override
  UserInfoHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInfoHiveModel(
      id: fields[0] as int,
      name: fields[1] as String,
      email: fields[2] as String,
      bio: fields[3] as String?,
      image: fields[4] as String?,
      role: fields[5] as UserType,
    );
  }

  @override
  void write(BinaryWriter writer, UserInfoHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.bio)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.role);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInfoHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserTypeAdapter extends TypeAdapter<UserType> {
  @override
  final int typeId = 19;

  @override
  UserType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UserType.student;
      case 1:
        return UserType.teacher;
      case 2:
        return UserType.parent;
      case 3:
        return UserType.assistant;
      case 4:
        return UserType.admin;
      default:
        return UserType.student;
    }
  }

  @override
  void write(BinaryWriter writer, UserType obj) {
    switch (obj) {
      case UserType.student:
        writer.writeByte(0);
        break;
      case UserType.teacher:
        writer.writeByte(1);
        break;
      case UserType.parent:
        writer.writeByte(2);
        break;
      case UserType.assistant:
        writer.writeByte(3);
        break;
      case UserType.admin:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
