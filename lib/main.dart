import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskability/home/home_page.dart';
import 'package:taskability/models/task.dart';

Future<void> main() async {
  // Initializes Hive in application documents directory.
  await Hive.initFlutter();

  // Register TaskAdapter.
  Hive.registerAdapter(TaskAdapter());

  // Opens the task storage box.
  await Hive.openBox<Task>('tasks');
  
  runApp(const App(),);
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'taskability',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        splashColor: Colors.transparent,
      ),
      home: const HomePage(),
    );
  }
}