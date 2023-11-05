import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:droidcon_flutter/src/application/state/actions/tasks/find_all_tasks_action.dart';
import 'package:droidcon_flutter/src/application/state/app_state.dart';
import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:droidcon_flutter/src/domain/interfaces/tasks/i_task_repository.dart';
import 'package:flutter/material.dart';

class UpdateTaskStatusAction extends ReduxAction<AppState> {
  final TaskEntity task;
  final BuildContext context;
  final ITaskRepository repository;

  UpdateTaskStatusAction({
    required this.task,
    required this.context,
    required this.repository,
  });

  @override
  Future<AppState?> reduce() async {
    await repository.updateTask(id: task.id!, data: task);

    store.dispatch(
      FindAllTasks(
        context: context,
        repository: repository,
      ),
    );

    return state;
  }
}
