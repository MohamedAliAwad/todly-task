import 'package:flutter/material.dart';
import 'package:todoly/data/task.dart';
import 'package:todoly/persentaion/screens/home_screen.dart';

class NewTasksScreen extends StatefulWidget {
  const NewTasksScreen({Key? key}) : super(key: key);

  @override
  State<NewTasksScreen> createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen> {
  List<Task> tasks = [
    Task(taskName: "eat breakfast"),
    Task(taskName: "drink cofee"),
    Task(taskName: "morining training"),
    Task(taskName: "Go to Work"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              tasks[index].taskName,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    decoration:
                        tasks[index].isDone ? TextDecoration.lineThrough : null,
                  ),
            ),
            trailing: Checkbox(
              onChanged: (val) {
                setState(() {
                  tasks[index].isDone = val!;
                  if (tasks[index].isDone) {
                    tasks[index].donetime == DateTime.now();
                  }
                });
              },
              value: tasks[index].isDone,
            ),
          );
        },
        itemCount: tasks.length,
        /* ListView(
              children: tasks
                  .map(
                    (elemnt) => ListTile(
                      title: Text(elemnt.taskName),
                      trailing: Checkbox(
                        onChanged: (val) {
                          setState(() {
                            elemnt.isDone = val!;
                          });
                        },
                        value: elemnt.isDone,
                      ),
                    ),
                  )
                  .toList()),*/
      ),
    );
  }
}
