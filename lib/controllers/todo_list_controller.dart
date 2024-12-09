import 'package:flutter/material.dart';
import 'package:web_flutter_todo/models/task.dart';
import 'package:web_flutter_todo/services/task_service.dart';

class TodoListController extends ChangeNotifier {
  final TaskService taskService;
  List<Task> tasks = [];

  TodoListController({required this.taskService});

  // Carrega as tarefas da base de dados ou armazenamento
  Future<void> loadTasks() async {
    tasks = await taskService.loadTasks();
    notifyListeners(); // Notifica que o estado foi alterado
  }

  // Adiciona uma nova tarefa
  Future<void> addTask(Task task) async {
    tasks.add(task);
    await taskService.saveTasks(tasks); // Salva as tarefas atualizadas
    notifyListeners();
  }

  // Remove uma tarefa
  Future<void> removeTask(String taskId) async {
    tasks.removeWhere((task) => task.id == taskId);
    await taskService.deleteTask(taskId);
    notifyListeners();
  }

  // Alterna o status de concluído de uma tarefa
  Future<void> toggleTaskStatus(int index) async {
    tasks[index].done = !tasks[index].done;
    await taskService.saveTasks(tasks); // Salva a tarefa com o status alterado
    notifyListeners();
  }
}
