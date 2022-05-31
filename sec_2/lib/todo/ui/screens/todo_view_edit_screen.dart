import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec_2/todo/index.dart';

class TodoViewEditScreen extends StatelessWidget {
  TodoViewEditScreen({
    Key? key,
    required this.todo,
  }) : super(key: key) {
    descCtrl.text = todo.description;
    priorityCtrl.text = todo.priority.toString();
  }

  final Todo todo;
  final descCtrl = TextEditingController();
  final priorityCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.description),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: descCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: priorityCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              BlocListener<TodoBloc, TodoState>(
                listener: (_, TodoState state) {
                  if (state is UpdateSuccessful) {
                    Navigator.pop(context, true);
                  }
                },
                child: ElevatedButton(
                  onPressed: () {
                    final todoBloc = BlocProvider.of<TodoBloc>(context);
                    todoBloc.add(
                      UpdateTodo(
                        Todo(
                          id: todo.id,
                          description: descCtrl.text,
                          priority: int.parse(priorityCtrl.text),
                        ),
                      ),
                    );
                  },
                  child: Text("Update"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
