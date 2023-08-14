import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:droidcon_flutter/src/domain/interfaces/i_data_source_facade.dart';

abstract class ITaskRepository {
  final IDataSourceFacade<TaskEntity> db;

  ITaskRepository(this.db);

  Future<TaskEntity?> createTask(TaskEntity data);
  Future<TaskEntity?> findTask({required String id});
  Future<List<TaskEntity>> findTasks();
  Future<TaskEntity?> updateTask({
    required String id,
    required TaskEntity data,
  });
  Future<bool?> deleteTask({required String id});
}
