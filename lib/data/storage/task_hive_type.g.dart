// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_hive_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskHiveTypeAdapter extends TypeAdapter<TaskHiveType> {
  @override
  final int typeId = 0;

  @override
  TaskHiveType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskHiveType(
      id: fields[0] as int?,
      userId: fields[1] as int?,
      title: fields[2] as String?,
      dueOn: fields[3] as String?,
      status: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskHiveType obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.dueOn)
      ..writeByte(4)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskHiveTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
