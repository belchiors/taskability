import 'dart:async';
import 'task_model.dart';

import 'task_repo.dart';

class TaskBloc {

  TaskBloc() {
    getAll();
  }

  final _repo = TaskRepository();
  final _streamController = StreamController<List<Task>>();

  Stream<List<Task>> get stream => _streamController.stream;

  void getAll() {
    final tasks = _repo.getAll();
    _streamController.sink.add(tasks);
  }

  void createTask(String text) {
    if (text.isNotEmpty) {
      final newTask = Task(text);
      _repo.addTask(newTask);
      getAll();
    }
  }
  
  void deleteTask() {
    // Delete a task.
  }

  void markAsComplete() {
    // Mark as complete.
  }

  void clearAll() {
    _repo.clearAll();
    getAll();
  }

  void dispose() {
    _streamController.close();
  }
}