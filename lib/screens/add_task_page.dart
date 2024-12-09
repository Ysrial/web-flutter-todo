import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController taskController = TextEditingController();
  bool _isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: const InputDecoration(
                labelText: 'Título da Tarefa',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isButtonDisabled
                  ? null
                  : () {
                      final taskText = taskController.text.trim();

                      // Verifica se o título da tarefa não é vazio
                      if (taskText.isNotEmpty) {
                        Navigator.pop(context, taskText);
                        // Exibe um SnackBar após adicionar a tarefa
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Tarefa adicionada com sucesso!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        // Mostra um SnackBar se o título for vazio
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Por favor, insira um título para a tarefa.'),
                            duration: Duration(seconds: 2),
                          ),
                        );

                        // Desabilita o botão após o clique
                        setState(() {
                          _isButtonDisabled = true;
                        });

                        // Reabilita o botão após um pequeno atraso
                        Future.delayed(const Duration(seconds: 2), () {
                          setState(() {
                            _isButtonDisabled = false;
                          });
                        });
                      }
                    },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
