// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return _AppState.fromJson(json);
}

/// @nodoc
mixin _$AppState {
  @JsonKey(
      name: 'theme',
      defaultValue: ThemeMode.light,
      unknownEnumValue: ThemeMode.system)
  ThemeMode? get themeMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'tasks_state')
  TasksState? get tasksState => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Wait? get wait => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'theme',
          defaultValue: ThemeMode.light,
          unknownEnumValue: ThemeMode.system)
      ThemeMode? themeMode,
      @JsonKey(name: 'tasks_state') TasksState? tasksState,
      @JsonKey(includeFromJson: false, includeToJson: false) Wait? wait});

  $TasksStateCopyWith<$Res>? get tasksState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = freezed,
    Object? tasksState = freezed,
    Object? wait = freezed,
  }) {
    return _then(_value.copyWith(
      themeMode: freezed == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode?,
      tasksState: freezed == tasksState
          ? _value.tasksState
          : tasksState // ignore: cast_nullable_to_non_nullable
              as TasksState?,
      wait: freezed == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as Wait?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TasksStateCopyWith<$Res>? get tasksState {
    if (_value.tasksState == null) {
      return null;
    }

    return $TasksStateCopyWith<$Res>(_value.tasksState!, (value) {
      return _then(_value.copyWith(tasksState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateCopyWith(
          _$_AppState value, $Res Function(_$_AppState) then) =
      __$$_AppStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'theme',
          defaultValue: ThemeMode.light,
          unknownEnumValue: ThemeMode.system)
      ThemeMode? themeMode,
      @JsonKey(name: 'tasks_state') TasksState? tasksState,
      @JsonKey(includeFromJson: false, includeToJson: false) Wait? wait});

  @override
  $TasksStateCopyWith<$Res>? get tasksState;
}

/// @nodoc
class __$$_AppStateCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$_AppState>
    implements _$$_AppStateCopyWith<$Res> {
  __$$_AppStateCopyWithImpl(
      _$_AppState _value, $Res Function(_$_AppState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = freezed,
    Object? tasksState = freezed,
    Object? wait = freezed,
  }) {
    return _then(_$_AppState(
      themeMode: freezed == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode?,
      tasksState: freezed == tasksState
          ? _value.tasksState
          : tasksState // ignore: cast_nullable_to_non_nullable
              as TasksState?,
      wait: freezed == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as Wait?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppState implements _AppState {
  _$_AppState(
      {@JsonKey(
          name: 'theme',
          defaultValue: ThemeMode.light,
          unknownEnumValue: ThemeMode.system)
      this.themeMode,
      @JsonKey(name: 'tasks_state') this.tasksState,
      @JsonKey(includeFromJson: false, includeToJson: false) this.wait});

  factory _$_AppState.fromJson(Map<String, dynamic> json) =>
      _$$_AppStateFromJson(json);

  @override
  @JsonKey(
      name: 'theme',
      defaultValue: ThemeMode.light,
      unknownEnumValue: ThemeMode.system)
  final ThemeMode? themeMode;
  @override
  @JsonKey(name: 'tasks_state')
  final TasksState? tasksState;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Wait? wait;

  @override
  String toString() {
    return 'AppState(themeMode: $themeMode, tasksState: $tasksState, wait: $wait)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppState &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.tasksState, tasksState) ||
                other.tasksState == tasksState) &&
            (identical(other.wait, wait) || other.wait == wait));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, themeMode, tasksState, wait);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      __$$_AppStateCopyWithImpl<_$_AppState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppStateToJson(
      this,
    );
  }
}

abstract class _AppState implements AppState {
  factory _AppState(
      {@JsonKey(
          name: 'theme',
          defaultValue: ThemeMode.light,
          unknownEnumValue: ThemeMode.system)
      final ThemeMode? themeMode,
      @JsonKey(name: 'tasks_state') final TasksState? tasksState,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final Wait? wait}) = _$_AppState;

  factory _AppState.fromJson(Map<String, dynamic> json) = _$_AppState.fromJson;

  @override
  @JsonKey(
      name: 'theme',
      defaultValue: ThemeMode.light,
      unknownEnumValue: ThemeMode.system)
  ThemeMode? get themeMode;
  @override
  @JsonKey(name: 'tasks_state')
  TasksState? get tasksState;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Wait? get wait;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
