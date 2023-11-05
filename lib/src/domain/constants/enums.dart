import 'package:hive/hive.dart';

enum AppContext {
  development,
  staging,
  production,
}

@HiveField(4)
enum TaskStatus {
  @HiveField(1)
  open,
  @HiveField(2)
  done,
  @HiveField(3)
  unknown,
}
