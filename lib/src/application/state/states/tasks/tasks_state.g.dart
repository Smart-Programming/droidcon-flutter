// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TasksState _$$_TasksStateFromJson(Map<String, dynamic> json) =>
    _$_TasksState(
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => TaskEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedTask: json['selected_task'] == null
          ? null
          : TaskEntity.fromJson(json['selected_task'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TasksStateToJson(_$_TasksState instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
      'selected_task': instance.selectedTask,
    };
