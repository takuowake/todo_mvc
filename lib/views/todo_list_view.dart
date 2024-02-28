import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoListView extends StatelessWidget {
  final List<Todo> todos;
  final Function onToggle;
  final Function onDelete;

  const TodoListView({super.key, required this.todos, required this.onToggle, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(todos[index].title),
          leading: Checkbox(
            value: todos[index].isCompleted,
            onChanged: (bool? value) {
              if (value != null) {
                onToggle(index);
              }
            },
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              onDelete(index);
            },
          ),
        );
      },
    );
  }
}
