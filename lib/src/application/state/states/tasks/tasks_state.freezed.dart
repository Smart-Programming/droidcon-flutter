// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TasksState _$TasksStateFromJson(Map<String, dynamic> json) {
  return _TasksState.fromJson(json);
}

/// @nodoc
mixin _$TasksState {
  @JsonKey(name: 'tasks')
  List<TaskEntity>? get tasks => throw _privateConstructorUsedError;
  @JsonKey(name: 'selected_task')
  TaskEntity? get selectedTask => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TasksStateCopyWith<TasksState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksStateCopyWith<$Res> {
  factory $TasksStateCopyWith(
          TasksState value, $Res Function(TasksState) then) =
      _$TasksStateCopyWithImpl<$Res, TasksState>;
  @useResult
  $Res call(
      {@JsonKey(name: 'tasks') List<TaskEntity>? tasks,
      @JsonKey(name: 'selected_task') TaskEntity? selectedTask});

  $TaskEntityCopyWith<$Res>? get selectedTask;
}

/// @nodoc
class _$TasksStateCopyWithImpl<$Res, $Val extends TasksState>
    implements $TasksStateCopyWith<$Res> {
  _$TasksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = freezed,
    Object? selectedTask = freezed,
  }) {
    return _then(_value.copyWith(
      tasks: freezed == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>?,
      selectedTask: freezed == selectedTask
          ? _value.selectedTask
          : selectedTask // ignore: cast_nullable_to_non_nullable
              as TaskEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskEntityCopyWith<$Res>? get selectedTask {
    if (_value.selectedTask == null) {
      return null;
    }

    return $TaskEntityCopyWith<$Res>(_value.selectedTask!, (value) {
      return _then(_value.copyWith(selectedTask: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TasksStateCopyWith<$Res>
    implements $TasksStateCopyWith<$Res> {
  factory _$$_TasksStateCopyWith(
          _$_TasksState value, $Res Function(_$_TasksState) then) =
      __$$_TasksStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'tasks') List<TaskEntity>? tasks,
      @JsonKey(name: 'selected_task') TaskEntity? selectedTask});

  @override
  $TaskEntityCopyWith<$Res>? get selectedTask;
}

/// @nodoc
class __$$_TasksStateCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$_TasksState>
    implements _$$_TasksStateCopyWith<$Res> {
  __$$_TasksStateCopyWithImpl(
      _$_TasksState _value, $Res Function(_$_TasksState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = freezed,
    Object? selectedTask = freezed,
  }) {
    return _then(_$_TasksState(
      tasks: freezed == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>?,
      selectedTask: freezed == selectedTask
          ? _value.selectedTask
          : selectedTask // ignore: cast_nullable_to_non_nullable
              as TaskEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TasksState implements _TasksState {
  _$_TasksState(
      {@JsonKey(name: 'tasks') final List<TaskEntity>? tasks,
      @JsonKey(name: 'selected_task') this.selectedTask})
      : _tasks = tasks;

  factory _$_TasksState.fromJson(Map<String, dynamic> json) =>
      _$$_TasksStateFromJson(json);

  final List<TaskEntity>? _tasks;
  @override
  @JsonKey(name: 'tasks')
  List<TaskEntity>? get tasks {
    final value = _tasks;
    if (value == null) return null;
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'selected_task')
  final TaskEntity? selectedTask;

  @override
  String toString() {
    return 'TasksState(tasks: $tasks, selectedTask: $selectedTask)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TasksState &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.selectedTask, selectedTask) ||
                other.selectedTask == selectedTask));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_tasks), selectedTask);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TasksStateCopyWith<_$_TasksState> get copyWith =>
      __$$_TasksStateCopyWithImpl<_$_TasksState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TasksStateToJson(
      this,
    );
  }
}

abstract class _TasksState implements TasksState {
  factory _TasksState(
          {@JsonKey(name: 'tasks') final List<TaskEntity>? tasks,
          @JsonKey(name: 'selected_task') final TaskEntity? selectedTask}) =
      _$_TasksState;

  factory _TasksState.fromJson(Map<String, dynamic> json) =
      _$_TasksState.fromJson;

  @override
  @JsonKey(name: 'tasks')
  List<TaskEntity>? get tasks;
  @override
  @JsonKey(name: 'selected_task')
  TaskEntity? get selectedTask;
  @override
  @JsonKey(ignore: true)
  _$$_TasksStateCopyWith<_$_TasksState> get copyWith =>
      throw _privateConstructorUsedError;
}
