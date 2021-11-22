// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expression_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpressionAdapter extends TypeAdapter<Expression> {
  @override
  final int typeId = 0;

  @override
  Expression read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Expression(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Expression obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.expression);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpressionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
