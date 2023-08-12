// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskEntity _$$_TaskEntityFromJson(Map<String, dynamic> json) =>
    _$_TaskEntity(
      taskStatus: $enumDecodeNullable(_$TaskStatusEnumMap, json['status'],
          unknownValue: TaskStatus.unknown),
      name: json['name'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$_TaskEntityToJson(_$_TaskEntity instance) =>
    <String, dynamic>{
      'status': _$TaskStatusEnumMap[instance.taskStatus],
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

const _$TaskStatusEnumMap = {
  TaskStatus.open: 'open',
  TaskStatus.done: 'done',
  TaskStatus.unknown: 'unknown',
};
