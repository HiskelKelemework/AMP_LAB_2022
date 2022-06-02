import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec_2/todo/index.dart';
import 'package:sec_2/todo/repository/todo_repository.dart';
import 'package:sec_2/todo/ui/screens/todo_view_edit_screen.dart';

class TodoListScreen extends StatelessWidget {
  TodoListScreen({Key? key}) : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todos")),
      body: BlocBuilder<TodoBloc, TodoState>(
        buildWhen: (p, c) => c is! UpdateSuccessful,
        builder: (_, TodoState state) {
          if (state is TodosLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is TodosLoadingFailed) {
            return Center(
              child: Text(state.msg),
            );
          }

          if (state is TodosLoaded) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (_, int i) {
                return ListTile(
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TodoViewEditScreen(
                          todo: state.todos[i],
                        ),
                      ),
                    );

                    if (result == null) return;

                    final todoBloc = BlocProvider.of<TodoBloc>(context);
                    todoBloc.add(LoadTodos());
                  },
                  title: Text(state.todos[i].description),
                );
              },
            );
          }

          return const Text("should never happen");
        },
      ),
    );
  }
}
