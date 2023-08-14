import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:droidcon_flutter/src/application/state/actions/tasks/update_tasks_state_action.dart';
import 'package:droidcon_flutter/src/application/state/app_state.dart';
import 'package:droidcon_flutter/src/application/state/flags/flags.dart';
import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:droidcon_flutter/src/domain/interfaces/tasks/i_task_repository.dart';
import 'package:flutter/material.dart';

class FindAllTasks extends ReduxAction<AppState> {
  FindAllTasks({
    required this.repository,
    required this.context,
  });

  final BuildContext context;
  final ITaskRepository repository;

  @override
  void after() {
    store.dispatch(WaitAction<AppState>.remove(AppFlags.findAllTasksFlag));
    super.after();
  }

  @override
  FutureOr<void> before() {
    store.dispatch(WaitAction<AppState>.add(AppFlags.findAllTasksFlag));
    return super.before();
  }

  @override
  Future<AppState?> reduce() async {
    List<TaskEntity> results = await repository.findTasks();

    store.dispatch(
      UpdateTasksStateAction(tasks: results),
    );

    return state;
  }
}
