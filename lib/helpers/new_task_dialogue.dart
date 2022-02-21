import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/models/todo_task_data.dart';

class NewTaskDialogue extends StatefulWidget {
  const NewTaskDialogue({Key? key}) : super(key: key);

  @override
  _NewTaskDialogueState createState() => _NewTaskDialogueState();
}

class _NewTaskDialogueState extends State<NewTaskDialogue> {
  final _formKey = GlobalKey<FormState>();
  String? _title;
  String? _description = "No description.";
  double _sliderValue = 1.0;

  @override
  Widget build(BuildContext context) {
    // I'm not sure if dialogs are outside the widget tree, or if it's because this
    // widget is being rendered from a callback, but the consumer is needed in order
    // to access Provider here.
    return Consumer<TaskModel>(
      builder: (BuildContext ctx, TaskModel tsk, Widget? _) => AlertDialog(
        // Actions -------------------------------------------------------
        actions: <TextButton>[
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel")),
          // Button in the Alert Dialog to add new tasks.
          TextButton(
            child: const Text("Create"),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                tsk.addTodoTask(TodoTaskData(
                    title: _title,
                    description: _description,
                    rank: _sliderValue));
                Navigator.pop(context);
              }
            },
          ),
        ],
        // Content -------------------------------------------------------
        content: Form(
          key: _formKey,
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            // The field to input the Task Name.
            TextFormField(
              onChanged: (value) => _title = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name for the task.';
                }
                return null;
              },
              decoration: const InputDecoration(labelText: 'Task Name'),
            ),
            // Field to input Task Description.
            TextFormField(
              onChanged: (value) => _description = value,
              decoration: const InputDecoration(labelText: 'Description.'),
            ),
            // Slider
            Slider.adaptive(
              label: '$_sliderValue',
              value: _sliderValue,
              onChanged: (newSliderValue) =>
                  setState(() => _sliderValue = newSliderValue),
              divisions: 10,
              min: 1,
              max: 10,
            ),
          ]),
        ),
      ),
    );
  }
}
