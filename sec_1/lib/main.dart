import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec_1/auth/bloc/auth_bloc.dart';
import 'package:sec_1/auth/index.dart';
import 'package:sec_1/home/index.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
