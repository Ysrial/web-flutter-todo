import 'package:flutter/material.dart';

class AddTaskController extends ChangeNotifier {
  final TextEditingController taskController = TextEditingController();
  bool isButtonDisabled = true;
  bool _isSaving = false;
  bool get isSaving => _isSaving;

  void onTextChanged(String text) {
    isButtonDisabled = text.trim().isEmpty;
    notifyListeners();
  }

  String getTaskTitle() {
    return taskController.text.trim();
  }

  Future<void> saveTask() async {
    _isSaving = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    taskController.clear();
    _isSaving = false;
    notifyListeners();
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }
}
