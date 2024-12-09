import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_flutter_todo/services/storage_service.dart';

class SharedPreferencesStorageService implements StorageService {
  @override
  Future<List<Map<String, dynamic>>> loadTasks(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final tasksJson = prefs.getString(key);
      if (tasksJson != null && tasksJson.isNotEmpty) {
        return List<Map<String, dynamic>>.from(jsonDecode(tasksJson));
      }
      return [];
    } catch (e) {
      print("Erro ao carregar tarefas: $e");
      return [];
    }
  }

  @override
  Future<void> saveTasks(List<Map<String, dynamic>> tasks, String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final tasksJson = jsonEncode(tasks);
      await prefs.setString(key, tasksJson);
    } catch (e) {
      print("Erro ao salvar tarefas: $e");
    }
  }
}
