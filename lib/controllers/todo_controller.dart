import 'package:todo_app/models/todo_list.dart';

class TodoController {
  final TodoList todoList = TodoList();

  void dispose() {
    // 現在は何も解放するリソースがないので空
  }

  void addTodo(String title) {
    todoList.addTodo(title);
  }

  void toggleTodo(int id) {
    final todo = todoList.todos.firstWhere((todo) => todo.id == id);
    todo.toggleCompleted();
  }

  void deleteTodo(int id) {
    todoList.deleteTodo(id);
  }
}
