import 'package:flutter/material.dart';
import 'package:web_flutter_todo/models/task.dart';
import 'package:web_flutter_todo/services/task_service.dart';

class TodoListController extends ChangeNotifier {
  final TaskService taskService;
  List<Task> tasks = [];

  TodoListController({required this.taskService});

  Future<void> loadTasks() async {
    tasks = await taskService.loadTasks();
    notifyListeners(); 
  }

  Future<void> addTask(Task task) async {
    tasks.add(task);
    await taskService.saveTasks(tasks);
    notifyListeners();
  }

  Future<void> removeTask(String taskId) async {
    tasks.removeWhere((task) => task.id == taskId);
    await taskService.deleteTask(taskId);
    notifyListeners();
  }

  Future<void> toggleTaskStatus(int index) async {
    tasks[index].done = !tasks[index].done;
    await taskService.saveTasks(tasks);
    notifyListeners();
  }
}
