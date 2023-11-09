// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskStatusAdapter extends TypeAdapter<TaskStatus> {
  @override
  final int typeId = 2;

  @override
  TaskStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return TaskStatus.open;
      case 2:
        return TaskStatus.done;
      case 3:
        return TaskStatus.unknown;
      default:
        return TaskStatus.open;
    }
  }

  @override
  void write(BinaryWriter writer, TaskStatus obj) {
    switch (obj) {
      case TaskStatus.open:
        writer.writeByte(1);
        break;
      case TaskStatus.done:
        writer.writeByte(2);
        break;
      case TaskStatus.unknown:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
