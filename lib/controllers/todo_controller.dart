import 'package:todo_app/models/todo_list.dart';

class TodoController {
  final TodoList todoList = TodoList();

  void addTodo(String title) {
    todoList.addTodo(title);
  }

  void toggleTodo(int index) {
    todoList.todos[index].toggleCompleted();
  }

  void deleteTodo(int index) {
    todoList.deleteTodo(index);
  }
}
