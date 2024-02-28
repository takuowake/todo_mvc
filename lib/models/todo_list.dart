import 'package:todo_app/models/todo.dart';

class TodoList {
  List<Todo> todos = [];
  int _lastId = -1;

  /// idをインクリメントし、ToDoを追加
  void addTodo(String title) {
    final todo = Todo(id: ++_lastId, title: title);
    todos.add(todo);
  }

  /// 指定されたidのToDoをリストから削除
  void deleteTodo(int id) {
    todos.removeWhere((todo) => todo.id == id);
  }
}