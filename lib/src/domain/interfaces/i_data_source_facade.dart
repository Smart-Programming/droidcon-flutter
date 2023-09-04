abstract class IDataSourceFacade<T> {
  Future<T> initDatabase();
  Future<T?> create({required dynamic data});
  Future<List<T>> findMany();
  Future<T?> findOne({required String id});
  Future<T?> update({required String id, dynamic data});
  Future<bool> delete({required String id});
}
