import 'dart:convert';

import 'package:droidcon_flutter/src/application/state/states/tasks/tasks_state.dart';
import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Tasks State', () {
    test('should have initial states', () {
      final TasksState tasksState = TasksState.initial();

      expect(tasksState, TasksState.initial());
      expect(tasksState.tasks, isNotNull);
      expect(tasksState.tasks, <TaskEntity>[]);
    });

    test('should convert to json', () {
      final TasksState tasksState = TasksState(
        tasks: <TaskEntity>[TaskEntity(name: 'Test')],
      );

      final Map<String, dynamic> json = tasksState.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['tasks'], isNotNull);
      expect(json['selected_task'], isNull);
    });

    test('should convert from json', () {
      final TasksState tasksState = TasksState(
        tasks: <TaskEntity>[TaskEntity(name: 'Test')],
      );

      final Map<String, dynamic> json = jsonDecode(
        jsonEncode(tasksState.toJson()),
      ) as Map<String, dynamic>;

      expect(json, isA<Map<String, dynamic>>());
      expect(json['tasks'], isNotNull);
      expect(json['selected_task'], isNull);

      final TasksState fromJson = TasksState.fromJson(json);

      expect(fromJson, isA<TasksState>());
      expect(fromJson.tasks, tasksState.tasks);
      expect(fromJson.selectedTask, tasksState.selectedTask);
    });
  });
}
