import 'package:sec_3/todo/data_provider/todo_provider.dart';
import 'package:sec_3/todo/index.dart';
import 'package:sec_3/utils/either.dart';

class TodoRepository {
  TodoProvider todoProvider;
  TodoRepository(this.todoProvider);

  Future<List<Todo>> getTodosWithPriority(int priority) async {
    final todos = await todoProvider.getAllTodos();
    return todos.where((todo) => todo.priority == priority).toList();
  }

  Future<Either<List<Todo>>> getAllTodos() async {
    try {
      final todos = await todoProvider.getAllTodos();
      return Either(val: todos);
    } catch (err) {
      return Either(error: "Couldn't load todos");
    }
  }

  Future<Either<Todo>> getTodo(int id) async {
    try {
      final todo = await todoProvider.getTodo(id);
      return Either(val: todo);
    } catch (err) {
      return Either(error: "Todo not found");
    }
  }

  addTodo(Todo todo) async {
    // check for profanity
    // todo.description.contains("sidib");
    final newTodo = Todo(
      id: todo.id,
      priority: todo.priority,
      description: todo.description.trim(),
    );

    await todoProvider.addTodo(newTodo);
  }

  Future<Either<String>> editTodo(int id, Todo todo) async {
    try {
      if (todo.description.contains("hello")) {
        return Either(error: "Profanity not allowed");
      }

      final newTodo = Todo(
        id: todo.id,
        priority: todo.priority,
        description: todo.description.trim(),
      );

      await todoProvider.editTodo(id, newTodo);
      return Either(val: "");
    } catch (err) {
      return Either(error: "Todo not found");
    }
  }
}
