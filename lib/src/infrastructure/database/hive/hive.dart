import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:droidcon_flutter/src/domain/interfaces/i_data_source_facade.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveTasksDatabase implements IDataSourceFacade<TaskEntity> {
  late Box<TaskEntity> _box;

  @override
  Future<TaskEntity?> create({required dynamic data}) async {
    await _box.add(data);
    return data;
  }

  @override
  Future<bool> delete({required String id}) async {
    final task = await findOne(id: id);
    if (task != null) {
      await _box.delete(task.id);
      return true;
    }
    return false;
  }

  @override
  Future<List<TaskEntity>> findMany() {
    final tasks = _box.values.toList();
    return Future.value(tasks);
  }

  @override
  Future<TaskEntity?> findOne({required String id}) {
    final task = _box.values.firstWhere((task) => task.id == id);
    return Future.value(task);
  }

  @override
  Future<TaskEntity?> initDatabase() async {
    await Hive.initFlutter();
    await Hive.openBox<TaskEntity>('tasks');
    _box = Hive.box<TaskEntity>('tasks');
    return null;
  }

  @override
  Future<TaskEntity?> update({required String id, dynamic data}) async {
    final existingTask = await findOne(id: id);
    if (existingTask != null) {
      await _box.put(id, data);
      return data;
    }
    return null;
  }
}
