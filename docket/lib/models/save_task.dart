import 'package:docket/models/task_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SaveTask extends ChangeNotifier {
  //list of tasks
  final List<Task> task = [];

  //get tasks
  List<Task> getTask() => task;

  //add tasks
  void addTask(Task tasks) {
    task.add(tasks);
    notifyListeners();
  }
  
  //line through
  void checkTask(int index) {
    task[index].isDone();
    notifyListeners();
  }

  //remove task
  void removeTask(Task tasks) {
    task.remove(tasks);
    notifyListeners();
  }
}
