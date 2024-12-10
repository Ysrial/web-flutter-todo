abstract class StorageServiceInterface {
  Future<List<Map<String, dynamic>>> loadTasks(String key);
  Future<void> saveTasks(List<Map<String, dynamic>> tasks, String key);
  Future<void> deleteTask(String id, String key);
}
