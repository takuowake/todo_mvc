import 'package:todo_app/models/todo.dart';

class TodoList {
  List<Todo> todos = [];
  int _nextId = 0; // カウンターを追加

  /// 新しいTodoをリストに追加
  void addTodo(String title) { // 引数からidを削除
    final todo = Todo(id: _nextId++, title: title);
    todos.add(todo);
  }

  /// 指定されたIDのToDoをリストから削除
  void deleteTodo(int id) {
    todos.removeWhere((todo) => todo.id == id);
  }
}