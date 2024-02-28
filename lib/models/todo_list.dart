import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
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

  /// データの保存
  Future<void> saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = jsonEncode(todos.map((todo) => todo.toJson()).toList());
    await prefs.setString('todoList', encodedData);
  }

  /// shared_preferenceからデータを取得
  Future<void> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodedData = prefs.getString('todoList');
    if (encodedData != null) {
      final List<dynamic> decodedData = jsonDecode(encodedData);
      todos = decodedData.map((item) => Todo.fromJson(item)).toList();
    }
  }
}