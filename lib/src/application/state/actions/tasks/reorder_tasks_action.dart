import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:droidcon_flutter/src/application/state/actions/tasks/find_all_tasks_action.dart';
import 'package:droidcon_flutter/src/application/state/app_state.dart';
import 'package:droidcon_flutter/src/domain/constants/enums.dart';
import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:droidcon_flutter/src/domain/interfaces/tasks/i_task_repository.dart';
import 'package:flutter/material.dart';

class ReorderTasksAction extends ReduxAction<AppState> {
  final TaskEntity oldTask;
  final TaskEntity newTask;
  final BuildContext context;
  final ITaskRepository repository;

  ReorderTasksAction({
    required this.oldTask,
    required this.newTask,
    required this.context,
    required this.repository,
  });

  @override
  Future<AppState?> reduce() async {
    int? tmp = oldTask.sortOrder;
    await repository.updateTask(
      id: oldTask.id!,
      data: oldTask.copyWith(
        sortOrder: newTask.sortOrder,
        taskStatus: oldTask.taskStatus ?? TaskStatus.unknown,
      ),
    );

    await repository.updateTask(
      id: newTask.id!,
      data: newTask.copyWith(
        sortOrder: tmp,
        taskStatus: newTask.taskStatus ?? TaskStatus.unknown,
      ),
    );

    store.dispatch(
      FindAllTasks(
        context: context,
        repository: repository,
      ),
    );

    return state;
  }
}
