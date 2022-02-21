import 'package:flutter/material.dart';

class TodoTask extends StatefulWidget {
  final String? title;
  final String? description;
  final double? rank;
  bool? done;
  TodoTask({
    Key? key,
    required this.title,
    required this.description,
    required this.rank,
    required this.done,
  }) : super(key: key);

  @override
  _TodoTaskState createState() => _TodoTaskState();
}

class _TodoTaskState extends State<TodoTask> {
  bool? _done = false;
  TextDecoration _textStrikeThrough = TextDecoration.none;
  @override
  Widget build(BuildContext context) {
    _textStrikeThrough =
        _done! ? TextDecoration.lineThrough : TextDecoration.none;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: <Widget>[
              Text(
                widget.title ?? 'Task',
                style: TextStyle(
                    decoration: _textStrikeThrough,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.description ?? 'Description',
                style: TextStyle(
                    decoration: _textStrikeThrough, color: Colors.grey[700]),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Checkbox(
              value: _done,
              onChanged: (value) => setState(() => _done = value),
            ),
          )
        ],
      ),
    );
  }
}
