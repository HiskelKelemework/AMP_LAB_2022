import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<Increment, int> {
  CounterBloc() : super(15) {
    on<Increment>(_onIncrement);
  }

  void _onIncrement(Increment event, Emitter emit) {
    emit(state + 1);
  }
}
