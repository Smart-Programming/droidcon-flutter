import 'package:droidcon_flutter/src/domain/constants/enums.dart';
import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:droidcon_flutter/src/domain/interfaces/i_data_source_facade.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

class SQFliteTasksDatabase implements IDataSourceFacade<TaskEntity> {
  late Database database;
  @override
  Future<TaskEntity?> create({required TaskEntity data}) async {
    await database.insert('tasks', data.toJson());
    return data;
  }

  @override
  Future<bool> delete({required String id}) async {
    final int result = await database.rawDelete(
      'DELETE FROM tasks WHERE id = ?',
      <String>[id],
    );

    return result == 0;
  }

  @override
  Future<List<TaskEntity>> findMany() async {
    final List<Map<String, dynamic>> result = await database.query(
      'tasks',
      orderBy: 'sort_order',
    );
    List<TaskEntity> tasks = <TaskEntity>[];

    result.forEach((Map<String, dynamic> record) {
      tasks.add(TaskEntity.fromJson(record));
    });

    return tasks;
  }

  @override
  Future<TaskEntity?> findOne({required String id}) async {
    final List<Map<String, dynamic>> result = await database.query(
      'tasks',
      where: '$id = ?',
      whereArgs: <String>[id],
    );

    if (result.isEmpty) {
      return null;
    }

    return TaskEntity.fromJson(result.first);
  }

  @override
  Future<TaskEntity?> initDatabase() async {
    // Get a location using getDatabasesPath
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await runMigrations(db);
      await seedInitialData(db);
    });

    return null;
  }

  @override
  Future<TaskEntity?> update({
    required String id,
    required TaskEntity data,
  }) async {
    await database.rawUpdate(
      'UPDATE tasks SET name = ?, status = ?, sort_order = ?, updated_at = ? WHERE id = ?;',
      <dynamic>[
        data.name ?? '',
        data.taskStatus?.name ?? TaskStatus.unknown.name,
        data.sortOrder ?? 1,
        data.updatedAt ?? DateTime.now().toIso8601String(),
        id,
      ],
    );

    return data;
  }
}

Future<void> runMigrations(Database db) async {
  await db.execute(
    'CREATE TABLE IF NOT EXISTS tasks (id int primary key default (uuid()), name TEXT, status TEXT NULLABLE, sort_order INTEGER NULLABLE, created_at TEXT NULLABLE, updated_at TEXT NULLABLE)',
  );
}

Future<void> seedInitialData(Database db) async {
  List<TaskEntity> tasks = <TaskEntity>[
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

  tasks.forEach((TaskEntity task) async {
    await db.insert(
      'tasks',
      task.toJson(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  });
}
