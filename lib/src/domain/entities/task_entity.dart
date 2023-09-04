import 'package:droidcon_flutter/src/domain/constants/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_entity.freezed.dart';
part 'task_entity.g.dart';

@freezed
class TaskEntity with _$TaskEntity {
  factory TaskEntity({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'status', unknownEnumValue: TaskStatus.unknown)
    TaskStatus? taskStatus,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _TaskEntity;

  factory TaskEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskEntityFromJson(json);

  factory TaskEntity.initial() => TaskEntity(
        createdAt: null,
        updatedAt: null,
        name: null,
        taskStatus: null,
      );
}
