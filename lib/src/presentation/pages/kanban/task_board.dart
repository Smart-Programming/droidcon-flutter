import 'package:async_redux/async_redux.dart';
import 'package:droidcon_flutter/bin/app_wrapper.dart';
import 'package:droidcon_flutter/src/application/state/actions/tasks/create_task_action.dart';
import 'package:droidcon_flutter/src/application/state/actions/tasks/find_all_tasks_action.dart';
import 'package:droidcon_flutter/src/application/state/app_state.dart';
import 'package:droidcon_flutter/src/application/state/view_models/task_board_view_model.dart';
import 'package:droidcon_flutter/src/application/utils/to_do_tile.dart';
import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:droidcon_flutter/src/domain/interfaces/i_data_source_facade.dart';
import 'package:droidcon_flutter/src/infrastructure/database/hive/hive.dart';
import 'package:droidcon_flutter/src/infrastructure/database/hive/task_database.dart';
import 'package:hive/hive.dart';
import 'package:droidcon_flutter/src/application/utils/dialog_box.dart';
import 'package:droidcon_flutter/src/application/utils/global_container.dart';
import 'package:flutter/material.dart';

class TaskBoard extends StatefulWidget {
  const TaskBoard({super.key});

  @override
  State<TaskBoard> createState() => _TaskBoardState();
}

class _TaskBoardState extends State<TaskBoard> {
  final _controller = TextEditingController();

  void saveNewTask() {
    StoreProvider.dispatch(
      context,
      CreateTaskAction(
        // TODO: Populate task entity with data
        task: TaskEntity(),
        repository: AppWrapper.of(context).tasksRepository!,
        context: context,
      ),
    );
    Navigator.of(context).pop();
  }

  void addNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          'DRAGGABLE TASKS',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black.withOpacity(.4),
        toolbarHeight: 40,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNewTask(),
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
      ),
      body: StoreConnector<AppState, TaskBoardViewModel>(
        converter: (Store<AppState> store) =>
            TaskBoardViewModel.fromStore(store),
        onInit: (store) {
          store.dispatch(
            FindAllTasks(
              repository: AppWrapper.of(context).tasksRepository!,
              context: context,
            ),
          );
        },
        builder: (BuildContext context, TaskBoardViewModel vm) {
          if (vm.tasks.isEmpty) {
            return const Center(
              child: Text(
                'No Tasks in List!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            );
          }

          return ListView.builder(
            itemCount: vm.tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  vm.tasks[index].name ?? '',
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
