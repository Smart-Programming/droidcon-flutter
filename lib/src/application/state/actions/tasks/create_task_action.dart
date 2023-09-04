import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:droidcon_flutter/src/application/state/actions/tasks/find_all_tasks_action.dart';
import 'package:droidcon_flutter/src/application/state/app_state.dart';
import 'package:droidcon_flutter/src/application/state/flags/flags.dart';
import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:droidcon_flutter/src/domain/interfaces/tasks/i_task_repository.dart';
import 'package:flutter/material.dart';

class CreateTaskAction extends ReduxAction<AppState> {
  CreateTaskAction({
    required this.task,
    required this.repository,
    required this.context,
  });

  final BuildContext context;
  final ITaskRepository repository;
  final TaskEntity task;

  @override
  void after() {
    store.dispatch(WaitAction<AppState>.remove(AppFlags.createTaskFlag));
    super.after();
  }

  @override
  FutureOr<void> before() {
    store.dispatch(WaitAction<AppState>.add(AppFlags.createTaskFlag));
    return super.before();
  }

  @override
  Future<AppState?> reduce() async {
    await repository.createTask(task);

    store.dispatch(
      FindAllTasks(
        context: context,
        repository: repository,
      ),
    );

    return state;
  }
}
