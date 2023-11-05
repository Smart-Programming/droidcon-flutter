// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskEntityAdapter extends TypeAdapter<TaskEntity> {
  @override
  final int typeId = 1;

  @override
  TaskEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskEntity(
      id: fields[0] as String?,
      name: fields[1] as String?,
      createdAt: fields[2] as String?,
      updatedAt: fields[3] as String?,
      taskStatus: TaskStatus.values
          .firstWhere((element) => element.name == fields[4].toString()),
    );
  }

  @override
  void write(BinaryWriter writer, TaskEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.updatedAt)
      ..writeByte(4)
      ..write(obj.taskStatus?.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskEntity _$$_TaskEntityFromJson(Map<String, dynamic> json) =>
    _$_TaskEntity(
      id: json['id'] as String?,
      name: json['name'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      taskStatus: $enumDecodeNullable(_$TaskStatusEnumMap, json['status'],
          unknownValue: TaskStatus.unknown),
    );

Map<String, dynamic> _$$_TaskEntityToJson(_$_TaskEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'status': _$TaskStatusEnumMap[instance.taskStatus],
    };

const _$TaskStatusEnumMap = {
  TaskStatus.open: 'open',
  TaskStatus.done: 'done',
  TaskStatus.unknown: 'unknown',
};
