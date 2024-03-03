import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/controllers/todo_controller.dart';

void main() {
  group('TodoController', () {
    TodoController todoController;

    setUp(() {
      todoController = TodoController();
    });

    tearDown(() {
      todoController.dispose();
    });

    test('addTodo should add a new todo', () {
      final initialTodoCount = todoController.todoList.todos.length;
      todoController.addTodo('New Todo');
      expect(todoController.todoList.todos.length, initialTodoCount + 1);
    });

    test('toggleTodo should toggle the completed status of a todo', () {
      final todoId = 1;
      final initialCompletedStatus = todoController.todoList.getTodoById(todoId).completed;
      todoController.toggleTodo(todoId);
      expect(todoController.todoList.getTodoById(todoId).completed, !initialCompletedStatus);
    });

    test('deleteTodo should delete a todo', () {
      final todoId = 1;
      final initialTodoCount = todoController.todoList.todos.length;
      todoController.deleteTodo(todoId);
      expect(todoController.todoList.todos.length, initialTodoCount - 1);
    });

    test('loadTodos should load todos from a data source', () async {
      await todoController.loadTodos();
      expect(todoController.todoList.todos.isNotEmpty, true);
    });

    test('saveTodos should save todos to a data source', () async {
      await todoController.saveTodos();
      // Add your assertion here to verify that todos are saved successfully
    });
  });
}
