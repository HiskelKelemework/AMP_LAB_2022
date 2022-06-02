import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec_3/todo/bloc/todo_bloc.dart';
import 'package:sec_3/todo/ui/screens/todo_view_edit_screen.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todos")),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (_, TodoState state) {
          if (state is TodosLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is TodosLoadFailed) {
            return Center(
              child: Text(state.msg),
            );
          }

          final todos = (state as TodosLoaded).todos;

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (_, int i) {
              return ListTile(
                title: Text(todos[i].description),
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TodoViewEditScreen(todo: todos[i]),
                    ),
                  );

                  if (result == null) return;
                  BlocProvider.of<TodoBloc>(context).add(LoadTodos());
                },
              );
            },
          );
        },
      ),
    );
  }
}
