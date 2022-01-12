import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskability/models/task.dart';

class TaskRepository {
  
  final Box<Task> _box = Hive.box<Task>('tasks');

  List<Task> getAll() => _box.values.toList();

  Future<void> addTask(Task task) async {
    await _box.add(task);
  }

  Future<void> deleteTask(Task task) async {
    // Delete task.
  }

  Future<void> markAsComplete(Task task) async {
    // Mark task as complete.
  }

  Future<void> clearAll() async {
    await _box.clear();
  }

  void dispose() {
    _box.close();
  }
}