import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/pomodoro_model.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/models/todo_task_data.dart';
import 'package:todo/pages/home_page.dart';
import 'package:desktop_window/desktop_window.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Needed for DesktopWindow to work.
  if (Platform.isAndroid || Platform.isIOS || Platform.isFuchsia) {
    // If the platform is mobile, don't use DesktopWindow.
  } else {
    await DesktopWindow.setMinWindowSize(const Size(680, 420));
  }
  // Initiating database.
  await Hive.initFlutter();
  Hive.registerAdapter(
      TodoTaskAdapter()); // Needed in order to put() TodoTaskData objects into the database.
  await Hive.openBox<TodoTaskData>('tasks');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<TaskModel>(
      create: (_) => TaskModel(),
    ),
    ChangeNotifierProvider<PomodoroModel>(
      create: (_) => PomodoroModel(),
    )
  ], child: const TodoApp()));
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.amberAccent,
      debugShowCheckedModeBanner: false,
      title: 'Mera Tasks',
      theme: todoTheme,
      home: const HomePage(),
    );
  }
}

ThemeData todoTheme = ThemeData(
  primarySwatch: Colors.amber,
  primaryColor: const Color(0xAA292950),
  backgroundColor: Colors.black,
  cardColor: Colors.deepOrangeAccent,
);
