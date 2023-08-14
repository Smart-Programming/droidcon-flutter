import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasks_state.freezed.dart';
part 'tasks_state.g.dart';

@freezed
class TasksState with _$TasksState {
  factory TasksState({
    @JsonKey(name: 'tasks') List<TaskEntity>? tasks,
    @JsonKey(name: 'selected_task') TaskEntity? selectedTask,
  }) = _TasksState;

  factory TasksState.fromJson(Map<String, dynamic> json) =>
      _$TasksStateFromJson(json);

  factory TasksState.initial() => TasksState(
        selectedTask: null,
        tasks: <TaskEntity>[],
      );
}
