import 'dart:convert';
import 'dart:math';

import 'package:droidcon_flutter/src/domain/constants/enums.dart';
import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:droidcon_flutter/src/infrastructure/repository/task_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks/tasks/database_mock.dart';

void main() {
  late TaskRepository repository;
  late TaskEntity task;

  setUpAll(() {
    repository = TaskRepository(mockTaskDatabase);
    task = TaskEntity(
      name: 'Sample task',
      taskStatus: TaskStatus.done,
    );
  });

  group('TaskRepository', () {
    test('should create a task', () async {
      expect(task.createdAt, null);
      expect(task.id, null);

      when(mockTaskDatabase.create(data: jsonEncode(task))).thenAnswer(
        (_) async => Future<TaskEntity>.value(
          task.copyWith(
            id: Random.secure().toString(),
            createdAt: DateTime.now().toIso8601String(),
          ),
        ),
      );

      final TaskEntity? result = await repository.createTask(task);
      expect(result, isNotNull);
      expect(result?.name, task.name);
      expect(result?.taskStatus, task.taskStatus);
      expect(result?.createdAt, isNotNull);
      expect(result?.id, isNotNull);
    });
    test('should delete a task', () async {
      final String id = Random.secure().toString();

      when(mockTaskDatabase.delete(id: id)).thenAnswer(
        (_) async => Future<bool>.value(true),
      );
      final bool? result = await repository.deleteTask(id: id);
      expect(result, isNotNull);
      expect(result, true);
    });
    test('should find tasks', () async {
      final List<TaskEntity> tasks = <TaskEntity>[];

      for (int i = 0; i < 4; i++) {
        tasks.add(
          task.copyWith(
            id: Random.secure().toString(),
            createdAt: DateTime.now().toIso8601String(),
          ),
        );
      }
      when(mockTaskDatabase.findMany()).thenAnswer(
        (_) async => Future<List<TaskEntity>>.value(tasks),
      );

      final List<TaskEntity>? result = await repository.findTasks();
      expect(result, isNotNull);
      expect(result, isNotEmpty);
      expect(result?.length, tasks.length);
    });

    test('should find single task', () async {
      final String id = Random.secure().toString();
      when(mockTaskDatabase.findOne(id: id)).thenAnswer(
        (_) async => Future<TaskEntity>.value(
          task.copyWith(
            id: id,
            createdAt: DateTime.now().toIso8601String(),
          ),
        ),
      );

      final TaskEntity? result = await repository.findTask(id: id);
      expect(result, isNotNull);
      expect(result?.name, task.name);
      expect(result?.taskStatus, task.taskStatus);
      expect(result?.createdAt, isNotNull);
      expect(result?.id, id);
    });
    test('should update task', () async {
      final String id = Random.secure().toString();
      final String updatedName = 'Updated Name';
      when(mockTaskDatabase.update(
          id: id,
          data: jsonEncode(
            task.copyWith(
              name: updatedName,
            ),
          ))).thenAnswer(
        (_) async => Future<TaskEntity>.value(
          task.copyWith(
            id: id,
            name: updatedName,
          ),
        ),
      );

      final TaskEntity? result = await repository.updateTask(
        id: id,
        data: task.copyWith(
          name: updatedName,
        ),
      );

      expect(result, isNotNull);
      expect(result?.name, updatedName);
      expect(result?.taskStatus, task.taskStatus);
      expect(result?.id, id);
    });
  });
}
