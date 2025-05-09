// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthInfoHiveModelAdapter extends TypeAdapter<AuthInfoHiveModel> {
  @override
  final int typeId = 17;

  @override
  AuthInfoHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthInfoHiveModel(
      token: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AuthInfoHiveModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthInfoHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
