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
      context
          .read<TodoListController>()
          .addTask(newTask); // Usando o controller para adicionar
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
      ),
      body: Consumer<TodoListController>(
        builder: (context, controller, child) {
          // Carregar as tarefas quando o controlador for inicializado
          if (controller.tasks.isEmpty) {
            controller.loadTasks(); // Certifique-se de carregar as tarefas
          }

          return controller.tasks.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Nenhuma tarefa cadastrada!',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => _navigateToAddTask(context),
                        child: const Text('Adicionar Nova Tarefa'),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: controller.tasks.length,
                  itemBuilder: (context, index) {
                    final task = controller.tasks[index];
                    return ListTile(
                      title: Text(
                        task.title,
                        style: TextStyle(
                          decoration: task.done
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      leading: Checkbox(
                        value: task.done,
                        onChanged: (value) {
                          if (value != null && value != task.done) {
                            // Muda o estado da tarefa apenas se houver mudança
                            controller.toggleTaskStatus(index);

                            // Verifica se a tarefa foi marcada como concluída e se a mensagem já foi mostrada
                            if (value && !task.done) {
                              // Exibe SnackBar somente se a tarefa foi concluída pela primeira vez
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Tarefa marcada como concluída!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          }
                        },
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          controller.removeTask(task.id);
                          // Exibe SnackBar quando a tarefa for deletada
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Tarefa removida com sucesso!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
        },
      ),
      // O botão de adicionar aparece apenas quando houver tarefas
      floatingActionButton: context.watch<TodoListController>().tasks.isNotEmpty
          ? FloatingActionButton(
              onPressed: () => _navigateToAddTask(context),
              child: const Icon(Icons.add),
            )
          : null, // O botão de adicionar é ocultado quando não houver tarefas
    );
  }
}
