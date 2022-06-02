import 'package:sec_3/todo/data_provider/todo_provider.dart';
import 'package:sec_3/todo/model/todo.dart';

class TodoRemoteProvider implements TodoProvider {
  @override
  Future<void> addTodo(Todo todo) {
    // TODO: implement addTodo
    throw UnimplementedError();
  }

  @override
  Future<void> editTodo(int id, Todo todo) {
    // TODO: implement editTodo
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getAllTodos() {
    // TODO: implement getAllTodos
    throw UnimplementedError();
  }

  @override
  Future<Todo> getTodo(int id) {
    // TODO: implement getTodo
    throw UnimplementedError();
  }
}
