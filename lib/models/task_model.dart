import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_flutter/models/todo_task_data.dart';

class TaskModel extends ChangeNotifier {
  List<TodoTaskData> get tasks {
    List<TodoTaskData> newTasks =
        Hive.box<TodoTaskData>('tasks').values.toList().cast<TodoTaskData>();

    return newTasks;
  }

  void addTodoTask(TodoTaskData n) {
    Hive.box<TodoTaskData>('tasks').put(n.title, n);
    notifyListeners();
  }

  void removeTodoTask(TodoTaskData r) {
    Hive.box<TodoTaskData>('tasks').delete(r.title);
    notifyListeners();
  }
}
