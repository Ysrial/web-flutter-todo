import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter_todo/controllers/add_task_controller.dart';
import 'package:web_flutter_todo/controllers/todo_list_controller.dart';
import 'package:web_flutter_todo/screens/todo_list_page.dart';
import 'package:web_flutter_todo/services/task_service.dart';
import 'package:web_flutter_todo/services/storage_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => TaskService(storage: StorageService())),
        ChangeNotifierProvider(
          create: (context) => TodoListController(
            taskService: Provider.of<TaskService>(context, listen: false),
          ),
        ),
        ChangeNotifierProvider(create: (context) => AddTaskController()),
      ],
      child: MaterialApp(
        home: Consumer<TaskService>(
          builder: (context, taskService, child) {
            return TodoListPage(
                taskService: taskService); 
          },
        ),
      ),
    );
  }
}
