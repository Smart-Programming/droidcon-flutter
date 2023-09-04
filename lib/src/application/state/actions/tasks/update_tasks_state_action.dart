import 'package:async_redux/async_redux.dart';
import 'package:droidcon_flutter/src/application/state/app_state.dart';
import 'package:droidcon_flutter/src/application/state/states/tasks/tasks_state.dart';
import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';

class UpdateTasksStateAction extends ReduxAction<AppState> {
  UpdateTasksStateAction({
    this.tasks,
    this.selectedTask,
  });

  final TaskEntity? selectedTask;
  final List<TaskEntity>? tasks;

  @override
  AppState? reduce() {
    final TasksState? old = state.tasksState;
    return store.state.copyWith.tasksState?.call(
      selectedTask: selectedTask ?? old?.selectedTask,
      tasks: tasks ?? old?.tasks,
    );
  }
}
