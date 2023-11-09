import 'package:droidcon_flutter/src/domain/constants/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'task_entity.freezed.dart';
part 'task_entity.g.dart';

@HiveType(typeId: 1)
@freezed
class TaskEntity with _$TaskEntity {
  factory TaskEntity({
    @HiveField(0) @JsonKey(name: 'id') String? id,
    @HiveField(1) @JsonKey(name: 'name') String? name,
    @HiveField(2) @JsonKey(name: 'created_at') String? createdAt,
    @HiveField(3) @JsonKey(name: 'updated_at') String? updatedAt,
    @HiveType(typeId: 2)
    @JsonKey(name: 'status', unknownEnumValue: TaskStatus.unknown)
    TaskStatus? taskStatus,
    @HiveField(5) @JsonKey(name: 'sort_order') int? sortOrder,
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
