import 'package:async_redux/async_redux.dart';
import 'package:droidcon_flutter/src/application/state/actions/tasks/create_task_action.dart';
import 'package:droidcon_flutter/src/application/state/app_state.dart';
import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:droidcon_flutter/src/domain/interfaces/tasks/i_task_repository.dart';
import 'package:flutter/material.dart';

class TaskBoardViewModel {
  TaskBoardViewModel({
    required this.tasks,
    required this.createTask,
  });

  final List<TaskEntity> tasks;
  final Function({
    required BuildContext context,
    required ITaskRepository repository,
    required TaskEntity task,
  }) createTask;

  static TaskBoardViewModel fromStore(Store<AppState> store) {
    return TaskBoardViewModel(
      tasks: store.state.tasksState?.tasks ?? <TaskEntity>[],
      createTask: ({
        required BuildContext context,
        required ITaskRepository repository,
        required TaskEntity task,
      }) {
        store.dispatch(
          CreateTaskAction(
            task: task,
            repository: repository,
            context: context,
          ),
        );
      },
    );
  }
}
