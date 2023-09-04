import 'dart:convert';

import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:droidcon_flutter/src/domain/interfaces/i_data_source_facade.dart';
import 'package:droidcon_flutter/src/domain/interfaces/tasks/i_task_repository.dart';

class TaskRepository extends ITaskRepository {
  final IDataSourceFacade<TaskEntity> database;
  TaskRepository(this.database) : super(database);

  @override
  Future<TaskEntity?> createTask(TaskEntity data) {
    return this.db.create(data: jsonEncode(data));
  }

  @override
  Future<bool?> deleteTask({required String id}) {
    return this.db.delete(id: id);
  }

  @override
  Future<TaskEntity?> findTask({required String id}) {
    return this.db.findOne(id: id);
  }

  @override
  Future<List<TaskEntity>> findTasks() {
    return this.db.findMany();
  }

  @override
  Future<TaskEntity?> updateTask({
    required String id,
    required TaskEntity data,
  }) {
    return this.db.update(id: id, data: jsonEncode(data));
  }
}
