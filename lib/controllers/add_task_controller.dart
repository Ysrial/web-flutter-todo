import 'package:flutter/material.dart';

class AddTaskController extends ChangeNotifier {
  final TextEditingController taskController = TextEditingController();
  bool isButtonDisabled = true;

  // Método que é chamado sempre que o texto é alterado
  void onTextChanged(String text) {
    isButtonDisabled = text.trim().isEmpty;
    notifyListeners(); // Atualiza a UI sempre que o estado mudar
  }

  // Retorna o texto da tarefa
  String getTaskTitle() {
    return taskController.text.trim();
  }

  // Limpa o controlador quando não for mais necessário
  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }
}
