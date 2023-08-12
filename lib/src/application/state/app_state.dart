import 'package:droidcon_flutter/src/application/state/states/tasks/tasks_state.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @JsonKey(
      name: 'theme',
      defaultValue: ThemeMode.light,
      unknownEnumValue: ThemeMode.system,
    )
    ThemeMode? themeMode,
    @JsonKey(name: 'tasks_state') TasksState? tasksState,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  factory AppState.initial() => AppState(
        tasksState: TasksState.initial(),
        themeMode: ThemeMode.light,
      );
}
