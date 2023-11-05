import 'package:hive/hive.dart';

enum AppContext {
  development,
  staging,
  production,
}

@HiveType(typeId: 2)
enum TaskStatus {
  @HiveField(1, defaultValue: 'open')
  open,
  @HiveField(2, defaultValue: 'done')
  done,
  @HiveField(3, defaultValue: 'unknown')
  unknown,
}
