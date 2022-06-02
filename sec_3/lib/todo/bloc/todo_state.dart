part of 'todo_bloc.dart';

abstract class TodoState {}

class TodosLoading extends TodoState {}

class TodosLoaded extends TodoState {
  List<Todo> todos;
  TodosLoaded(this.todos);
}

class TodosLoadFailed extends TodoState {
  final String msg;
  TodosLoadFailed(this.msg);
}

class UpdateSuccessful extends TodoState {}
