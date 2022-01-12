import 'dart:async';
import 'package:taskability/models/task.dart';
import 'package:taskability/models/task_repo.dart';

class HomeBloc {

  HomeBloc() {
    getAll();
  }

  final _repo = TaskRepository();
  final _streamController = StreamController<List<Task>>();

  Stream<List<Task>> get stream => _streamController.stream;

  void getAll() {
    final tasks = _repo.getAll();
    _streamController.sink.add(tasks);
  }

  void addTask(Task task) {
    _repo.addTask(task);
    getAll();
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