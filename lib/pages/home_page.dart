import 'package:flutter/material.dart';
import 'package:todo_flutter/pages/pomodoro_page.dart';
import 'package:todo_flutter/pages/tasks_page.dart';

import '../helpers/new_task_dialogue.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTabIndex = 0;
  final screens = <Widget>[
    const TasksPage(),
    const PomodoroPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // AppBar ------------------------------------------------------------
      appBar: AppBar(
        actions: <Widget>[
          InkWell(
            child: const Icon(Icons.announcement),
            onTap: () => debugPrint("Pressed alert on AppBar."),
          ),
          const SizedBox(width: 20.0),
        ],
        title: const Text("Mera Tasks"),
        centerTitle: true,
      ),
      // Body -----------------------------------------------------
      body: screens[_currentTabIndex],
      // Floating Action Button -------------------------------------------
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add new task.',
        onPressed: () => showDialog(
            context: context, builder: (ctx) => const NewTaskDialogue()),
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
        child: const Icon(Icons.add),
      ),

      // Bottom Navigation Bar --------------------------------------------
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        onTap: (value) => setState(() => _currentTabIndex = value),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch),
            label: 'Pomodoro',
          ),
        ],
      ),
    );
  }
}
