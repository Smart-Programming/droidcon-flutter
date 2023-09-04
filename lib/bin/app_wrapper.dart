import 'package:droidcon_flutter/src/domain/interfaces/tasks/i_task_repository.dart';
import 'package:flutter/material.dart';

class AppWrapper extends InheritedWidget {
  AppWrapper({
    super.key,
    required super.child,
    required this.tasksRepository,
  });

  final ITaskRepository? tasksRepository;

  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static AppWrapper of(BuildContext context) {
    final AppWrapper? result =
        context.dependOnInheritedWidgetOfExactType<AppWrapper>();

    return result!;
  }
}
