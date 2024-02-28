import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/todo.dart';

class TodoList {
  List<Todo> todos = [];

  /// 一意のidを生成
  int _generateUniqueId() {
    return todos.isEmpty ? 0 : todos.last.id + 1;
  }

  /// idを用いて、ToDoをリストに追加
  void addTodo(String title) {
    final todo = Todo(id: _generateUniqueId(), title: title);
    todos.add(todo);
    saveTodos();
  }

  /// 指定されたidのTodoの完了状態を切り替え
  void toggleCompleted(int id) {
    Todo? todo;
    try {
      todo = todos.firstWhere((todo) => todo.id == id);
      todo.toggleCompleted();
      saveTodos();
    } catch (e) {
      return;
    }
  }

  /// 指定されたidのToDoをリストから削除
  void deleteTodo(int id) {
    todos.removeWhere((todo) => todo.id == id);
    saveTodos();
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