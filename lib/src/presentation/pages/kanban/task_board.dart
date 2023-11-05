import 'package:droidcon_flutter/src/application/utils/to_do_tile.dart';
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

  var taskList = [
    {'name': 'Shopping', 'completed': true},
    {'name': 'Hitting the gym', 'completed': false},
    {'name': 'Lunch with Mum', 'completed': true},
    {'name': 'Group meeting', 'completed': false},
    {'name': 'Draft client proposal', 'completed': false},
    {'name': 'Quick team recap', 'completed': true},
  ];

  void saveNewTask() {
    setState(() {});
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
        body: const Center(
          child: Text(
            'No Tasks in List!',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
