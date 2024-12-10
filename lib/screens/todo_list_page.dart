import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter_todo/models/task.dart';
import 'package:web_flutter_todo/screens/add_task_page.dart';
import 'package:web_flutter_todo/services/task_service.dart';
import 'package:web_flutter_todo/controllers/todo_list_controller.dart';
import 'package:uuid/uuid.dart';

class TodoListPage extends StatelessWidget {
  final TaskService taskService;

  const TodoListPage({
    Key? key,
    required this.taskService,
  }) : super(key: key);

  Future<void> _navigateToAddTask(BuildContext context) async {
    final newTaskTitle = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddTaskPage(),
      ),
    );

    if (newTaskTitle != null) {
      final newTask = Task(
        id: Uuid().v4(),
        title: newTaskTitle,
      );
      context.read<TodoListController>().addTask(newTask);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Consumer<TodoListController>(
        builder: (context, controller, child) {
          if (controller.tasks.isEmpty) {
            controller.loadTasks();
          }

          return controller.tasks.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Nenhuma tarefa cadastrada!',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => _navigateToAddTask(context),
                        child: const Text('Adicionar Nova Tarefa'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 224, 226, 226),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: controller.tasks.length,
                  itemBuilder: (context, index) {
                    final task = controller.tasks[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(
                          task.title,
                          style: TextStyle(
                            decoration: task.done
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        leading: Checkbox(
                          value: task.done,
                          onChanged: (value) {
                            if (value != null && value != task.done) {
                              controller.toggleTaskStatus(index);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    value
                                        ? 'Tarefa marcada como concluída!'
                                        : 'Tarefa desmarcada!',
                                  ),
                                  duration: const Duration(seconds: 2),
                                  backgroundColor: Colors.green[
                                      300],
                                ),
                              );
                            }
                          },
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            controller.removeTask(task.id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Tarefa removida com sucesso!'),
                                duration: Duration(seconds: 2),
                                backgroundColor:
                                    Colors.red,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: context.watch<TodoListController>().tasks.isNotEmpty
          ? FloatingActionButton(
              onPressed: () => _navigateToAddTask(context),
              child: const Icon(Icons.add),
              backgroundColor: Colors.teal,
            )
          : null,
    );
  }
}
