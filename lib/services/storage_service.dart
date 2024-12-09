import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_flutter_todo/services/storage_service_interface.dart';

class StorageService implements StorageServiceInterface {
  @override
  Future<List<Map<String, dynamic>>> loadTasks(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(key);

      if (jsonString != null) {
        final List<dynamic> decodedData = jsonDecode(jsonString);
        return decodedData.map((task) => task as Map<String, dynamic>).toList();
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
      final jsonString = jsonEncode(tasks);
      await prefs.setString(key, jsonString);
    } catch (e) {
      print("Erro ao salvar tarefas: $e");
    }
  }
}
