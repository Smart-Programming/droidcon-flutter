// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskEntity _$TaskEntityFromJson(Map<String, dynamic> json) {
  return _TaskEntity.fromJson(json);
}

/// @nodoc
mixin _$TaskEntity {
  @HiveField(0)
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'status', unknownEnumValue: TaskStatus.unknown)
  TaskStatus? get taskStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskEntityCopyWith<TaskEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskEntityCopyWith<$Res> {
  factory $TaskEntityCopyWith(
          TaskEntity value, $Res Function(TaskEntity) then) =
      _$TaskEntityCopyWithImpl<$Res, TaskEntity>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'id') String? id,
      @HiveField(1) @JsonKey(name: 'name') String? name,
      @HiveField(2) @JsonKey(name: 'created_at') String? createdAt,
      @HiveField(3) @JsonKey(name: 'updated_at') String? updatedAt,
      @HiveField(4)
      @JsonKey(name: 'status', unknownEnumValue: TaskStatus.unknown)
      TaskStatus? taskStatus});
}

/// @nodoc
class _$TaskEntityCopyWithImpl<$Res, $Val extends TaskEntity>
    implements $TaskEntityCopyWith<$Res> {
  _$TaskEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? taskStatus = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      taskStatus: freezed == taskStatus
          ? _value.taskStatus
          : taskStatus // ignore: cast_nullable_to_non_nullable
              as TaskStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskEntityCopyWith<$Res>
    implements $TaskEntityCopyWith<$Res> {
  factory _$$_TaskEntityCopyWith(
          _$_TaskEntity value, $Res Function(_$_TaskEntity) then) =
      __$$_TaskEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'id') String? id,
      @HiveField(1) @JsonKey(name: 'name') String? name,
      @HiveField(2) @JsonKey(name: 'created_at') String? createdAt,
      @HiveField(3) @JsonKey(name: 'updated_at') String? updatedAt,
      @HiveField(4)
      @JsonKey(name: 'status', unknownEnumValue: TaskStatus.unknown)
      TaskStatus? taskStatus});
}

/// @nodoc
class __$$_TaskEntityCopyWithImpl<$Res>
    extends _$TaskEntityCopyWithImpl<$Res, _$_TaskEntity>
    implements _$$_TaskEntityCopyWith<$Res> {
  __$$_TaskEntityCopyWithImpl(
      _$_TaskEntity _value, $Res Function(_$_TaskEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? taskStatus = freezed,
  }) {
    return _then(_$_TaskEntity(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      taskStatus: freezed == taskStatus
          ? _value.taskStatus
          : taskStatus // ignore: cast_nullable_to_non_nullable
              as TaskStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskEntity implements _TaskEntity {
  _$_TaskEntity(
      {@HiveField(0) @JsonKey(name: 'id') this.id,
      @HiveField(1) @JsonKey(name: 'name') this.name,
      @HiveField(2) @JsonKey(name: 'created_at') this.createdAt,
      @HiveField(3) @JsonKey(name: 'updated_at') this.updatedAt,
      @HiveField(4)
      @JsonKey(name: 'status', unknownEnumValue: TaskStatus.unknown)
      this.taskStatus});

  factory _$_TaskEntity.fromJson(Map<String, dynamic> json) =>
      _$$_TaskEntityFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'id')
  final String? id;
  @override
  @HiveField(1)
  @JsonKey(name: 'name')
  final String? name;
  @override
  @HiveField(2)
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @HiveField(3)
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @HiveField(4)
  @JsonKey(name: 'status', unknownEnumValue: TaskStatus.unknown)
  final TaskStatus? taskStatus;

  @override
  String toString() {
    return 'TaskEntity(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, taskStatus: $taskStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.taskStatus, taskStatus) ||
                other.taskStatus == taskStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, createdAt, updatedAt, taskStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskEntityCopyWith<_$_TaskEntity> get copyWith =>
      __$$_TaskEntityCopyWithImpl<_$_TaskEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskEntityToJson(
      this,
    );
  }
}

abstract class _TaskEntity implements TaskEntity {
  factory _TaskEntity(
      {@HiveField(0) @JsonKey(name: 'id') final String? id,
      @HiveField(1) @JsonKey(name: 'name') final String? name,
      @HiveField(2) @JsonKey(name: 'created_at') final String? createdAt,
      @HiveField(3) @JsonKey(name: 'updated_at') final String? updatedAt,
      @HiveField(4)
      @JsonKey(name: 'status', unknownEnumValue: TaskStatus.unknown)
      final TaskStatus? taskStatus}) = _$_TaskEntity;

  factory _TaskEntity.fromJson(Map<String, dynamic> json) =
      _$_TaskEntity.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'id')
  String? get id;
  @override
  @HiveField(1)
  @JsonKey(name: 'name')
  String? get name;
  @override
  @HiveField(2)
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @HiveField(3)
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @HiveField(4)
  @JsonKey(name: 'status', unknownEnumValue: TaskStatus.unknown)
  TaskStatus? get taskStatus;
  @override
  @JsonKey(ignore: true)
  _$$_TaskEntityCopyWith<_$_TaskEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
