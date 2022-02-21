import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/helpers/todo_task.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/models/todo_task_data.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  List<TodoTaskData> tasks = <TodoTaskData>[];

  @override
  Widget build(BuildContext context) {
    tasks = Provider.of<TaskModel>(context).tasks;
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext ctx, int i) {
          return Column(
            children: [
              const SizedBox(height: 16.0),
              TodoTask(
                title: tasks[i].title,
                description: tasks[i].description,
                rank: tasks[i].rank,
                done: tasks[i].done,
              ),
            ],
          );
        });
  }
}
