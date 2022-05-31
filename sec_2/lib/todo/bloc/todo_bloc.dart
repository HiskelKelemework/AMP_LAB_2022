import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec_2/todo/bloc/todo_event.dart';
import 'package:sec_2/todo/bloc/todo_state.dart';
import 'package:sec_2/todo/repository/todo_repository.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;

  TodoBloc(this.todoRepository) : super(TodosLoading()) {
    on<LoadTodos>(_onLoadTodos);
    on<UpdateTodo>(_onUpdateTodo);
  }

  void _onLoadTodos(LoadTodos event, Emitter emit) async {
    emit(TodosLoading());
    await Future.delayed(const Duration(seconds: 3));
    final todos = await todoRepository.getAllTodos();
    if (todos.hasError) {
      emit(TodosLoadingFailed(todos.error!));
    } else {
      emit(TodosLoaded(todos.val!));
    }
  }

  void _onUpdateTodo(UpdateTodo event, Emitter emit) async {
    await todoRepository.editTodo(event.todo.id, event.todo);
    emit(UpdateSuccessful());
  }
}
