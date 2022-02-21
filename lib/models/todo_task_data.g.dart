// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_task_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoTaskAdapter extends TypeAdapter<TodoTaskData> {
  @override
  final int typeId = 0;

  @override
  TodoTaskData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoTaskData(
      title: fields[0] as String?,
      description: fields[1] as String?,
      dateString: fields[2] as String?,
      rank: fields[3] as double?,
    )..done = fields[4] as bool?;
  }

  @override
  void write(BinaryWriter writer, TodoTaskData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.dateString)
      ..writeByte(3)
      ..write(obj.rank)
      ..writeByte(4)
      ..write(obj.done);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
