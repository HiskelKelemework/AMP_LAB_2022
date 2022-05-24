import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec_2/home/bloc/count_event.dart';

class CounterBloc extends Bloc<Increment, int> {
  CounterBloc() : super(0) {
    on<Increment>(_onIncrement);
  }

  void _onIncrement(Increment event, Emitter emit) {
    emit(state + 1);
  }
}
