// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WishAdapter extends TypeAdapter<Wish> {
  @override
  final int typeId = 3;

  @override
  Wish read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Wish(
      id: fields[0] as String,
      thumbnail: fields[1] as dynamic,
      wishName: fields[2] as String,
      date: fields[3] as String,
      category: fields[4] as String,
      location: fields[5] as String,
      wishPrice: fields[6] as int,
      memo: fields[7] as String,
      amount: fields[8] as int,
      rowPrice: fields[9] as int,
      tagList: (fields[10] as List).cast<String>(),
      isFavorite: fields[11] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Wish obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.thumbnail)
      ..writeByte(2)
      ..write(obj.wishName)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.location)
      ..writeByte(6)
      ..write(obj.wishPrice)
      ..writeByte(7)
      ..write(obj.memo)
      ..writeByte(8)
      ..write(obj.amount)
      ..writeByte(9)
      ..write(obj.rowPrice)
      ..writeByte(10)
      ..write(obj.tagList)
      ..writeByte(11)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WishAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
