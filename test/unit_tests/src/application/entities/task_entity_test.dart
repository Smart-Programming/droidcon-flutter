import 'dart:convert';

import 'package:droidcon_flutter/src/domain/constants/enums.dart';
import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Task Item', () {
    test('should have initial', () {
      final TaskEntity taskEntity = TaskEntity.initial();

      expect(taskEntity, TaskEntity.initial());
      expect(taskEntity.name, null);
      expect(taskEntity.createdAt, null);
      expect(taskEntity.taskStatus, null);
    });

    test('should convert to json', () {
      final TaskEntity taskEntity = TaskEntity(
        name: 'Hit the gym',
        taskStatus: TaskStatus.open,
      );

      final Map<String, dynamic> json = taskEntity.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['name'], isNotNull);
      expect(json['status'], isNotNull);
    });

    test('should convert from json', () {
      final TaskEntity taskEntity = TaskEntity(
        name: 'Hit the gym',
        taskStatus: TaskStatus.open,
      );

      final Map<String, dynamic> json = jsonDecode(
        jsonEncode(taskEntity.toJson()),
      ) as Map<String, dynamic>;

      expect(json, isA<Map<String, dynamic>>());
      expect(json['name'], isNotNull);
      expect(json['status'], isNotNull);

      final TaskEntity fromJson = TaskEntity.fromJson(json);

      expect(fromJson, isA<TaskEntity>());
      expect(fromJson.name, taskEntity.name);
      expect(fromJson.taskStatus, taskEntity.taskStatus);
    });
  });
}
