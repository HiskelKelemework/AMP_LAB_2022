import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec_2/todo/index.dart';
import 'package:sec_2/todo/repository/todo_repository.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  RecipeApp({Key? key}) : super(key: key);

  final TodoBloc todoBloc = TodoBloc(TodoRepository(TodoLocalProvider()));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => todoBloc..add(LoadTodos()),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TodoListScreen(),
      ),
    );
  }
}
