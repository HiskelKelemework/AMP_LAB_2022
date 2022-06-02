import 'package:sec_3/todo/data_provider/todo_provider.dart';
import 'package:sec_3/todo/model/todo.dart';

class TodoLocalProvider implements TodoProvider {
  final _todos = <Todo>[
    for (int i = 0; i < 15; i++)
      Todo(description: "Todo number $i", priority: i)
  ];

  @override
  Future<void> addTodo(Todo todo) async {
    _todos.add(todo);
  }

  @override
  Future<void> editTodo(int id, Todo todo) async {
    for (int i = 0; i < _todos.length; i++) {
      if (_todos[i].id == id) {
        _todos[i] = Todo(
          id: id,
          description: todo.description,
          priority: todo.priority,
        );

        return;
      }
    }

    throw Exception("Todo with id $id not found");
  }

  @override
  Future<List<Todo>> getAllTodos() async {
    return _todos;
  }

  @override
  Future<Todo> getTodo(int id) async {
    for (var todo in _todos) {
      if (todo.id == id) {
        return todo;
      }
    }

    throw Exception("Todo with id $id not found");
  }
}
