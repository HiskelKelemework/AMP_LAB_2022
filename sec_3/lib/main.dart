import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec_3/todo/bloc/todo_bloc.dart';
import 'package:sec_3/todo/data_provider/todo_local_provider.dart';
import 'package:sec_3/todo/data_provider/todo_remote_provider.dart';
import 'package:sec_3/todo/index.dart';
import 'package:sec_3/todo/repository/todo_repository.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TodoBloc(TodoRepository(TodoLocalProvider()))..add(LoadTodos()),
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
