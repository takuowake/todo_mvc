import 'package:flutter/material.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'package:todo_app/views/todo_list_view.dart';

class TodoAppView extends StatefulWidget {
  const TodoAppView({super.key});

  @override
  _TodoAppViewState createState() => _TodoAppViewState();
}

class _TodoAppViewState extends State<TodoAppView> {
  final _controller = TodoController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _controller.loadTodos();
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO List'),
      ),
      body: TodoListView(
        todos: _controller.todoList.todos,
        onToggle: (id) {
          setState(() {
            _controller.toggleTodo(id);
          });
        },
        onDelete: (id) {
          setState(() {
            _controller.deleteTodo(id);
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _showAddTodoDialog(context);
          await _controller.saveTodos();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAddTodoDialog(BuildContext context) async {
    final textEditingController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add new TODO'),
          content: TextField(
            controller: textEditingController,
            decoration: const InputDecoration(hintText: 'Enter TODO title'),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Add'),
              onPressed: () {
                setState(() {
                  _controller.addTodo(textEditingController.text);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
