// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todoly/data/task.dart';

class ToDoScreen extends StatelessWidget {
  List<Task> toDoTasks;
  ToDoScreen({Key? key, required this.toDoTasks}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    toDoTasks = toDoTasks.where((element) => element.isDone == false).toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(toDoTasks[index].taskName),
        );
      },
      itemCount: toDoTasks.length,
    );
  }
}