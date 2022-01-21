import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskability/app/app.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('tasks');
  runApp(const App());
}