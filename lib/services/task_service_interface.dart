
import 'package:web_flutter_todo/models/task.dart';

abstract class TaskServiceInterface {
  Future<List<Task>> loadTasks();
  Future<void> saveTasks(List<Task> tasks);
  Future<void> deleteTask(String id);
}
