import 'package:flutter/material.dart';

class AddTaskController extends ChangeNotifier {
  final TextEditingController taskController = TextEditingController();
  bool isButtonDisabled = true;

  void onTextChanged(String text) {
    isButtonDisabled = text.trim().isEmpty;
    notifyListeners();
  }

  String getTaskTitle() {
    return taskController.text.trim();
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }
}
