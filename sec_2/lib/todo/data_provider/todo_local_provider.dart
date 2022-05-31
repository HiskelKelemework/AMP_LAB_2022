import 'package:sec_2/todo/index.dart';

class TodoLocalProvider implements TodoProvider {
  final List<Todo> _todos = [
    for (int i in List.generate(15, (i) => i))
      Todo(description: "Todo number $i", priority: i % 6)
  ];

  @override
  addTodo(Todo todo) async {
    return _todos.add(todo);
  }

  @override
  editTodo(int id, Todo todo) async {
    int index = -1;
    for (int i = 0; i < _todos.length; i++) {
      if (_todos[i].id == id) {
        index = i;
        break;
      }
    }

    if (index == -1) {
      throw Exception("Todo not found");
    }

    _todos[index] = Todo(
      description: todo.description,
      priority: todo.priority,
      id: id,
    );
  }

  @override
  Future<Todo> getTodo(int id) async {
    for (int i = 0; i < _todos.length; i++) {
      if (_todos[i].id == id) {
        return _todos[i];
      }
    }

    throw Exception('Todo not found');
  }

  @override
  Future<List<Todo>> getAllTodos() async {
    return _todos;
  }
}
