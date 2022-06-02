import 'dart:math';

class Todo {
  late int _id;
  final String description;
  final int priority;

  int get id => _id;

  Todo({required this.description, required this.priority, int? id}) {
    _id = id ?? Random.secure().nextInt(1000);
  }
}
