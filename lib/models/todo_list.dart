import 'package:todo_app/models/todo.dart';

class TodoList {
  List<Todo> todos = [];

  /// 新しいTodoをリストに追加
  void addTodo(String title) {
    final todo = Todo(id: todos.length, title: title);
    todos.add(todo);
  }

  /// 指定されたインデックスのToDoをリストから削除
  void deleteTodo(int index) {
    todos.removeAt(index);
  }
}