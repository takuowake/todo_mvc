import 'package:flutter/material.dart';
import 'package:todo_app/views/todo_app_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter MVC TODO App',
      home: TodoAppView(),
    );
  }
}
