import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec_1/home/bloc/counter_bloc.dart';
import 'package:sec_1/home/bloc/counter_event.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterBloc, int>(
                builder: (_, int state) {
                  return Text("$state", style: TextStyle(fontSize: 50));
                },
              ),
              LayoutBuilder(builder: (BuildContext ctx, _) {
                return ElevatedButton(
                  onPressed: () {
                    final counterBloc = BlocProvider.of<CounterBloc>(ctx);
                    counterBloc.add(Increment());
                  },
                  child: Icon(Icons.add),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
