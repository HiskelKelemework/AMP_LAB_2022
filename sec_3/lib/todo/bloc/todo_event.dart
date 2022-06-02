part of 'todo_bloc.dart';

abstract class TodoEvent {}

class LoadTodos extends TodoEvent {}

class UpdateTodo extends TodoEvent {
  final Todo todo;
  UpdateTodo(this.todo);
}
