import 'package:droidcon_flutter/src/application/utils/colors.dart';
import 'package:droidcon_flutter/src/application/utils/dialog_box.dart';
import 'package:droidcon_flutter/src/application/utils/global_container.dart';
import 'package:flutter/material.dart';

class TaskBoard extends StatefulWidget {
  const TaskBoard({super.key});

  @override
  State<TaskBoard> createState() => _TaskBoardState();
}

class _TaskBoardState extends State<TaskBoard> {
  final TextEditingController _controller = TextEditingController();

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

  void saveNewTask() {
    setState(() {});
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            const GlobalContainer(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => addNewTask(),
          backgroundColor: Colors.amber,
          child: const Icon(Icons.add),
        ));
  }
}
