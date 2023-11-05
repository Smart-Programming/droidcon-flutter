import 'package:async_redux/async_redux.dart';
import 'package:droidcon_flutter/bin/app_wrapper.dart';
import 'package:droidcon_flutter/src/application/state/actions/tasks/create_task_action.dart';
import 'package:droidcon_flutter/src/application/state/actions/tasks/find_all_tasks_action.dart';
import 'package:droidcon_flutter/src/application/state/actions/tasks/update_task_status_action.dart';
import 'package:droidcon_flutter/src/application/state/app_state.dart';
import 'package:droidcon_flutter/src/application/state/view_models/task_board_view_model.dart';
import 'package:droidcon_flutter/src/application/utils/dialog_box.dart';
import 'package:droidcon_flutter/src/application/utils/to_do_tile.dart';
import 'package:droidcon_flutter/src/domain/constants/enums.dart';
import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TaskBoard extends StatefulWidget {
  const TaskBoard({super.key});

  @override
  State<TaskBoard> createState() => _TaskBoardState();
}

class _TaskBoardState extends State<TaskBoard> {
  final TextEditingController _controller = TextEditingController();

  void saveNewTask(int sortOrder) {
    StoreProvider.dispatch(
      context,
      CreateTaskAction(
        task: TaskEntity(
          id: Uuid().v4(),
          name: _controller.text,
          taskStatus: TaskStatus.open,
          sortOrder: sortOrder,
        ),
        repository: AppWrapper.of(context).tasksRepository!,
        context: context,
      ),
    );
    _controller.clear();
    Navigator.of(context).pop();
  }

  void addNewTask(TaskBoardViewModel vm) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogBox(
            controller: _controller,
            onSave: () => saveNewTask(
                vm.tasks.isEmpty ? 1 : vm.tasks.last.sortOrder! + 1),
          );
        });
  }

  void deleteTask(int index, TaskBoardViewModel vm) {
    vm.deleteTask(
      repository: AppWrapper.of(context).tasksRepository!,
      context: context,
      task: vm.tasks[index],
    );
  }

  void checkBoxChange(bool? value, int index, TaskBoardViewModel vm) {
    StoreProvider.dispatch(
        context,
        UpdateTaskStatusAction(
          repository: AppWrapper.of(context).tasksRepository!,
          context: context,
          task: vm.tasks[index].copyWith(
            taskStatus: value != null && value == true
                ? TaskStatus.done
                : TaskStatus.open,
          ),
        ));
  }

  void reorderData(int oldindex, int newindex, TaskBoardViewModel vm) {
    TaskEntity oldTask = vm.tasks[oldindex];
    TaskEntity newTask = vm.tasks[newindex];

    vm.reOrderTasks(
      context: context,
      repository: AppWrapper.of(context).tasksRepository!,
      newTask: newTask,
      oldTask: oldTask,
    );
  }

  void sorting(TaskBoardViewModel vm) {
    setState(() {
      vm.tasks.sort();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/landing.jpg'),
              fit: BoxFit.cover,
              opacity: .4)),
      child: StoreConnector<AppState, TaskBoardViewModel>(
          converter: (Store<AppState> store) =>
              TaskBoardViewModel.fromStore(store),
          onInit: (Store<AppState> store) {
            store.dispatch(
              FindAllTasks(
                repository: AppWrapper.of(context).tasksRepository!,
                context: context,
              ),
            );
          },
          builder: (BuildContext context, TaskBoardViewModel vm) {
            return Scaffold(
              // backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: const Text(
                  'DRAGGABLE TASKS',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                backgroundColor: Colors.black.withOpacity(.4),
                toolbarHeight: 40,
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => addNewTask(vm),
                backgroundColor: Colors.amber,
                child: const Icon(Icons.add),
              ),
              body: Builder(
                builder: (BuildContext context) {
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

                  return ReorderableListView(
                    physics: const BouncingScrollPhysics(),
                    onReorder: (int a, int b) => reorderData(a, b, vm),
                    children: vm.tasks
                        .map(
                          (TaskEntity task) => ToDoTile(
                            key: Key(Uuid().v4().toString()),
                            name: task.name ?? '',
                            completed: task.taskStatus == TaskStatus.done,
                            onChanged: (bool? value) {
                              checkBoxChange(value, vm.tasks.indexOf(task), vm);
                            },
                            deleteFn: () =>
                                deleteTask(vm.tasks.indexOf(task), vm),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            );
          }),
    );
  }
}
