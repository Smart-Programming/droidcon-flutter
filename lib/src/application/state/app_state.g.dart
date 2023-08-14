// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppState _$$_AppStateFromJson(Map<String, dynamic> json) => _$_AppState(
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['theme'],
              unknownValue: ThemeMode.system) ??
          ThemeMode.light,
      tasksState: json['tasks_state'] == null
          ? null
          : TasksState.fromJson(json['tasks_state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AppStateToJson(_$_AppState instance) =>
    <String, dynamic>{
      'theme': _$ThemeModeEnumMap[instance.themeMode],
      'tasks_state': instance.tasksState,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
