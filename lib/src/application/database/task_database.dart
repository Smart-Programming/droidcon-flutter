import 'package:hive_flutter/adapters.dart';

class TaskDatabase {
  List taskList = [];

  final taskBox = Hive.box('task_box');

  void createInitialData() {
    taskList = [
      {'name': 'Shopping', 'completed': true},
      {'name': 'Hitting the gym', 'completed': false},
      {'name': 'Lunch with Mum', 'completed': true},
      {'name': 'Group meeting', 'completed': false},
      {'name': 'Draft client proposal', 'completed': false},
      {'name': 'Quick team recap', 'completed': true},
    ];
  }

  void loadData() {
    taskList = taskBox.get('TASKLIST');
  }

  void updateData() {
    taskBox.put('TASKLIST', taskList);
  }
}
