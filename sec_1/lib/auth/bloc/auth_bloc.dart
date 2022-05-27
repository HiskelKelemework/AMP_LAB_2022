import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec_1/auth/bloc/auth_event.dart';
import 'package:sec_1/auth/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Idle()) {
    on<Login>(_onLogin);
  }

  void _onLogin(Login event, Emitter emit) async {
    print("email ${event.email} :: pass ${event.pass}");
    emit(LogingIn());
    await Future.delayed(const Duration(seconds: 3));
    emit(LoginSuccessful());
  }
}
