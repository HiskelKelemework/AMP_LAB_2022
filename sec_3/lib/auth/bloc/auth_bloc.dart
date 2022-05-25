import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec_3/auth/bloc/auth_event.dart';
import 'package:sec_3/auth/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Idle()) {
    on<Login>(_onLogin);
  }

  void _onLogin(Login event, Emitter emit) async {
    print("email ${event.email} :: pass ${event.password}");
    emit(LogingIn());
    await Future.delayed(const Duration(seconds: 3));
    emit(LoginSuccessful());
    // loging in
    // sleep 3
    // login successful/failed
    // print("OnLogin called");
  }
}
