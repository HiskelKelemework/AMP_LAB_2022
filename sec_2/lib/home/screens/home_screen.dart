import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec_2/home/bloc/count_bloc.dart';
import 'package:sec_2/home/bloc/count_event.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => counterBloc,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterBloc, int>(
                builder: (_, int state) {
                  return Text(
                    "$state",
                    style: const TextStyle(fontSize: 55),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  counterBloc.add(Increment());
                },
                child: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}