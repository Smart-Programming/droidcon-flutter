import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:droidcon_flutter/src/application/state/actions/tasks/find_all_tasks_action.dart';
import 'package:droidcon_flutter/src/application/state/app_state.dart';
import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:droidcon_flutter/src/domain/interfaces/tasks/i_task_repository.dart';
import 'package:flutter/material.dart';

class DeleteTaskAction extends ReduxAction<AppState> {
  final TaskEntity task;
  final BuildContext context;
  final ITaskRepository repository;

  DeleteTaskAction({
    required this.task,
    required this.context,
    required this.repository,
  });

  @override
  Future<AppState?> reduce() async {
    await repository.deleteTask(id: task.id!);

    store.dispatch(
      FindAllTasks(
        context: context,
        repository: repository,
      ),
    );

    return state;
  }
}
