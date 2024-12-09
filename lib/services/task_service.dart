import 'package:web_flutter_todo/models/task.dart';
import 'package:web_flutter_todo/services/storage_service_interface.dart';

class TaskService {
  final StorageServiceInterface storage;
  final String _storageKey = 'tasks';

  TaskService({required this.storage});

  Future<List<Task>> loadTasks() async {
    try {
      final taskMaps = await storage.loadTasks(_storageKey);
      return taskMaps.map((map) => Task.fromMap(map)).toList();
    } catch (e) {
      print("Erro ao carregar tarefas: $e");
      return [];
    }
  }

  Future<void> saveTasks(List<Task> tasks) async {
    try {
      final taskMaps = tasks.map((task) => task.toMap()).toList();
      await storage.saveTasks(taskMaps, _storageKey);
    } catch (e) {
      print("Erro ao salvar tarefas: $e");
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      final tasks = await loadTasks();
      final updatedTasks = tasks.where((task) => task.id != id).toList();
      await saveTasks(updatedTasks);
    } catch (e) {
      print("Erro ao excluir tarefa: $e");
    }
  }
}
