import 'package:sec_2/todo/index.dart';

abstract class TodoState {}

class TodosLoading extends TodoState {}

class TodosLoaded extends TodoState {
  List<Todo> todos;
  TodosLoaded(this.todos);
}

class TodosLoadingFailed extends TodoState {
  final String msg;
  TodosLoadingFailed(this.msg);
}

class UpdateSuccessful extends TodoState {}
