import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec_1/auth/bloc/auth_bloc.dart';
import 'package:sec_1/auth/bloc/auth_event.dart';
import 'package:sec_1/auth/bloc/auth_state.dart';
import 'package:sec_1/home/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailCtrl,
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? email) {
                    if (email == null || email.isEmpty) {
                      return "Email must not be empty";
                    }

                    final emailTest = RegExp("[A-Za-z]@[A-Za-z].[A-Za-z]");
                    final emailValid = emailTest.hasMatch(email);

                    return emailValid ? null : "Email incorrect";
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: passCtrl,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? password) {
                    if (password == null || password.isEmpty) {
                      return "Password must not be empty";
                    }

                    return password.length >= 8 ? null : "Password too short";
                  },
                ),
                SizedBox(height: 10),
                BlocConsumer<AuthBloc, AuthState>(
                  listenWhen: (p, c) {
                    return c is LoginSuccessful;
                  },
                  listener: (_, AuthState state) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => HomeScreen()),
                    );
                  },
                  builder: (_, AuthState state) {
                    Widget buttonChild = const Text("Log in");

                    if (state is LogingIn) {
                      buttonChild = const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }

                    if (state is LoginSuccessful) {
                      buttonChild = const Text("Login Successful");
                    }

                    if (state is LoginFailed) {
                      buttonChild = const Text("Login failed");
                    }

                    return ElevatedButton(
                      onPressed: state is LogingIn
                          ? null
                          : () {
                              final formValid =
                                  formKey.currentState!.validate();
                              if (!formValid) return;

                              final authBloc =
                                  BlocProvider.of<AuthBloc>(context);
                              authBloc.add(
                                Login(
                                  email: emailCtrl.text,
                                  pass: passCtrl.text,
                                ),
                              );
                            },
                      child: buttonChild,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
