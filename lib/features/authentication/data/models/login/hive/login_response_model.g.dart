// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginResponseHiveModelAdapter
    extends TypeAdapter<LoginResponseHiveModel> {
  @override
  final int typeId = 0;

  @override
  LoginResponseHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginResponseHiveModel(
      success: fields[0] as bool,
      status: fields[1] as String,
      message: fields[2] as String,
      userId: fields[3] as int,
      token: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LoginResponseHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.success)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.message)
      ..writeByte(3)
      ..write(obj.userId)
      ..writeByte(5)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginResponseHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
