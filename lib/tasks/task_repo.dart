import 'package:hive_flutter/hive_flutter.dart';
import 'task_model.dart';

class TaskRepository {
  
  final Box _box = Hive.box('tasks');

  List<Task> getAll() => _box.values.map((map) => 
    Task.deserialize(Map<String, dynamic>.from(map))).toList();

  Future<void> addTask(Task task) async {
    await _box.add(task.serialize());
  }

  Future<void> deleteTask(int id) async {
    // Delete task.
  }

  Future<void> markAsComplete(int id) async {
    // Mark task as complete.
  }

  Future<void> clearAll() async {
    await _box.clear();
  }

  void dispose() {
    _box.close();
  }
}