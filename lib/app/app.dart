import 'package:flutter/material.dart';
import 'package:taskability/theme/theme.dart';
import 'package:taskability/tasks/tasks_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'taskability',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: const TasksPage(),
    );
  }
}