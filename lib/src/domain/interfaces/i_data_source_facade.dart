import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';

abstract class IDataSourceFacade<T> {
  Future<T?> initDatabase();
  Future<T?> create({required TaskEntity data});
  Future<List<T>> findMany();
  Future<T?> findOne({required String id});
  Future<T?> update({required String id, required TaskEntity data});
  Future<bool> delete({required String id});
}
