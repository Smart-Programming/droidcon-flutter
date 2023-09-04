import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:droidcon_flutter/src/domain/interfaces/i_data_source_facade.dart';

class SQFliteTasksDatabase implements IDataSourceFacade<TaskEntity> {
  @override
  Future<TaskEntity?> create({required dynamic data}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<bool> delete({required String id}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<TaskEntity>> findMany() {
    // TODO: implement findMany
    throw UnimplementedError();
  }

  @override
  Future<TaskEntity?> findOne({required String id}) {
    // TODO: implement findOne
    throw UnimplementedError();
  }

  @override
  Future<TaskEntity> initDatabase() {
    // TODO: implement initDatabase
    throw UnimplementedError();
  }

  @override
  Future<TaskEntity?> update({required String id, dynamic data}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
