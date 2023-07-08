import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/pages/home_page.dart';
import 'models/pomodoro_model.dart';
import 'models/task_model.dart';
import 'models/todo_task_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Needed for DesktopWindow to work.
      
  if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
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
      debugShowCheckedModeBanner: false,
      title: 'Mera Tasks',
      theme: todoTheme,
      home: const HomePage(),
    );
  }
}

ThemeData todoTheme = ThemeData.from(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
);
