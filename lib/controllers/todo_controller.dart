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
    todoList.toggleCompleted(id);
  }

  void deleteTodo(int id) {
    todoList.deleteTodo(id);
  }

  Future<void> loadTodos() async {
    await todoList.loadTodos();
  }

  Future<void> saveTodos() async {
    await todoList.saveTodos();
  }
}
