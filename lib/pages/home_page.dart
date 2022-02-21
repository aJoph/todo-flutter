import 'package:flutter/material.dart';
import 'package:todo/helpers/new_task_dialogue.dart';
import 'package:todo/pages/pomodoro_page.dart';
import 'package:todo/pages/tasks_page.dart';

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
      backgroundColor: Theme.of(context).backgroundColor,
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
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
            context: context, builder: (ctx) => const NewTaskDialogue()),
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
      ),

      // Bottom Navigation Bar --------------------------------------------
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        onTap: (value) => setState(() => _currentTabIndex = value),
        backgroundColor: Colors.deepOrange[300],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Tasks',
            backgroundColor: Colors.amberAccent,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.watch),
              label: 'Pomodoro',
              backgroundColor: Colors.amberAccent),
        ],
      ),
    );
  }
}
