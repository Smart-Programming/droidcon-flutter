import 'package:droidcon_flutter/src/domain/constants/enums.dart';
import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:droidcon_flutter/src/domain/interfaces/i_data_source_facade.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

class HiveTasksDatabase implements IDataSourceFacade<TaskEntity> {
  late Box<TaskEntity> _box;

  @override
  Future<TaskEntity?> create({required TaskEntity data}) async {
    await _box.put(data.id, data);
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
      List<TaskEntity> tasks = seedInitialData();
      tasks.forEach((TaskEntity task) {
        this.create(data: task);
      });
    }

    return null;
  }

  @override
  Future<TaskEntity?> update({
    required String id,
    required TaskEntity data,
  }) async {
    if (_box.containsKey(id)) {
      await _box.delete(id);
      await this.create(data: data);
      return data;
    }
    return null;
  }
}

List<TaskEntity> seedInitialData() {
  return <TaskEntity>[
    TaskEntity(
      id: Uuid().v4(),
      name: 'Shipping',
      sortOrder: 1,
      taskStatus: TaskStatus.done,
      createdAt: DateTime.now().toIso8601String(),
    ),
    TaskEntity(
      id: Uuid().v4(),
      name: 'Hitting the gym',
      sortOrder: 2,
      taskStatus: TaskStatus.open,
      createdAt: DateTime.now().toIso8601String(),
    ),
  ];
}
