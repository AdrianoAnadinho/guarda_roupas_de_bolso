// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocationAdapter extends TypeAdapter<Location> {
  @override
  final int typeId = 0;

  @override
  Location read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Location(
      title: fields[0] as String,
      shirtStatus: fields[2] as bool,
      shortsStatus: fields[3] as bool,
      shoeStatus: fields[4] as bool,
      socksStatus: fields[5] as bool,
      braStatus: fields[6] as bool,
      pantiesStatus: fields[7] as bool,
      time: fields[1] as TimeOfDay?,
    );
  }

  @override
  void write(BinaryWriter writer, Location obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.shirtStatus)
      ..writeByte(3)
      ..write(obj.shortsStatus)
      ..writeByte(4)
      ..write(obj.shoeStatus)
      ..writeByte(5)
      ..write(obj.socksStatus)
      ..writeByte(6)
      ..write(obj.braStatus)
      ..writeByte(7)
      ..write(obj.pantiesStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
