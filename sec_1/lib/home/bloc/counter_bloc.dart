import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec_1/home/bloc/counter_event.dart';

class CounterBloc extends Bloc<Increment, int> {
  CounterBloc() : super(0) {
    on<Increment>(_onIncrement);
  }

  int count = 0;

  void _onIncrement(Increment event, Emitter emit) {
    count++;
    emit(count);
  }
}
