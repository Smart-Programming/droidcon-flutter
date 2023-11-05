import 'package:droidcon_flutter/src/domain/constants/enums.dart';
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
    final TaskEntity? task = await findOne(id: id);
    if (task != null) {
      await _box.delete(task.id);
      return true;
    }
    return false;
  }

  @override
  Future<List<TaskEntity>> findMany() {
    final List<TaskEntity> tasks = _box.values.toList();
    return Future<List<TaskEntity>>.value(tasks);
  }

  @override
  Future<TaskEntity?> findOne({required String id}) {
    final TaskEntity task =
        _box.values.firstWhere((TaskEntity task) => task.id == id);
    return Future<TaskEntity?>.value(task);
  }

  @override
  Future<TaskEntity?> initDatabase() async {
    await Hive.initFlutter();

    Hive.registerAdapter<TaskEntity>(TaskEntityAdapter());
    await Hive.openBox<TaskEntity>('tasks');

    _box = Hive.box<TaskEntity>('tasks');

    if (_box.isEmpty) {
      _box.addAll(seedInitialData());
    }

    return null;
  }

  @override
  Future<TaskEntity?> update({required String id, dynamic data}) async {
    final TaskEntity? existingTask = await findOne(id: id);
    if (existingTask != null) {
      await _box.put(id, data);
      return data;
    }
    return null;
  }
}

List<TaskEntity> seedInitialData() {
  // var taskList = [
  //   {'name': 'Shopping', 'completed': true},
  //   {'name': 'Hitting the gym', 'completed': false},
  //   {'name': 'Lunch with Mum', 'completed': true},
  //   {'name': 'Group meeting', 'completed': false},
  //   {'name': 'Draft client proposal', 'completed': false},
  //   {'name': 'Quick team recap', 'completed': true},
  // ];
  return <TaskEntity>[
    TaskEntity(
      name: 'Shipping',
      taskStatus: TaskStatus.done,
      createdAt: DateTime.now().toIso8601String(),
    ),
    TaskEntity(
      name: 'Hitting the gym',
      taskStatus: TaskStatus.open,
      createdAt: DateTime.now().toIso8601String(),
    ),
  ];
}
