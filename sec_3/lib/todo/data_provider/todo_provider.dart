import 'package:sec_3/todo/index.dart';

abstract class TodoProvider {
  Future<void> addTodo(Todo todo);
  Future<void> editTodo(int id, Todo todo);
  Future<Todo> getTodo(int id);
  Future<List<Todo>> getAllTodos();
}
