import 'dart:convert';

import 'package:droidcon_flutter/src/application/state/app_state.dart';
import 'package:droidcon_flutter/src/application/state/states/tasks/tasks_state.dart';
import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App State', () {
    test('should have initial states', () {
      final AppState appState = AppState.initial();

      expect(appState, AppState.initial());
      expect(appState.tasksState, TasksState.initial());
      expect(appState.themeMode, ThemeMode.light);
    });

    test('should convert to json', () {
      final TasksState tasksState = TasksState(
        tasks: <TaskEntity>[TaskEntity(name: 'Test')],
      );

      final AppState appState = AppState(
        tasksState: tasksState,
        themeMode: ThemeMode.light,
      );

      final Map<String, dynamic> json = appState.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['tasks_state'], isNotNull);
      expect(json['theme'], isNotNull);
    });

    test('should convert from json', () {
      final TasksState tasksState = TasksState(
        tasks: <TaskEntity>[TaskEntity(name: 'Test')],
      );

      final AppState appState = AppState(
        tasksState: tasksState,
        themeMode: ThemeMode.light,
      );

      final Map<String, dynamic> json = jsonDecode(
        jsonEncode(appState.toJson()),
      ) as Map<String, dynamic>;

      expect(json, isA<Map<String, dynamic>>());
      expect(json['tasks_state'], isNotNull);
      expect(json['theme'], isNotNull);

      final AppState fromJson = AppState.fromJson(json);

      expect(fromJson, isA<AppState>());
      expect(fromJson.tasksState, tasksState);
      expect(fromJson.themeMode, ThemeMode.light);
    });
  });
}
