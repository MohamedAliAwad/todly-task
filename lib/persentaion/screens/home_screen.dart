// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, dead_code, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoly/data/task.dart';
import 'package:todoly/persentaion/screens/add_task_screen.dart';
import 'package:todoly/persentaion/screens/done_screen.dart';
import 'package:todoly/persentaion/screens/new_tasks_screen.dart';
import 'package:todoly/persentaion/screens/to_do_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int cindex = 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isBottomScreenShown = false;
  IconData fabIcon = Icons.add;
  TextEditingController taskNameConroller = TextEditingController();
  TextEditingController timeConroller = TextEditingController();
  TextEditingController dateConroller = TextEditingController();

  List<Widget> tasksScreens = [
    NewTasksScreen(),
    ToDoScreen(
      toDoTasks: [],
    ),
    DoneScreen(
      tasks: [],
    ),
  ];
  List<Task> tasks = [
    Task(taskName: "eat breakfast"),
    Task(taskName: "drink cofee"),
    Task(taskName: "morining training"),
    Task(taskName: "Go to Work"),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: scaffoldKey,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (isBottomScreenShown) {
              Navigator.pop(context);
              isBottomScreenShown = false;
              tasks.add(Task(taskName: taskNameConroller.text));
              print(tasks[4].taskName);
              setState(() {
                fabIcon = Icons.edit;
                if (taskNameConroller.text != "") {
                }
              });
            } else {
              scaffoldKey.currentState!.showBottomSheet(
                (context) => Container(
                  padding: EdgeInsets.only(
                    top: 35,
                    right: 20,
                    left: 20,
                  ),
                  color: Colors.grey[350],
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        // color: Colors.grey[200],
                        child: TextField(
                          controller: taskNameConroller,

                          onEditingComplete: () {
                            if (taskNameConroller.text != "") {
                              Navigator.of(context).pop(taskNameConroller.text);
                            }
                          },
                          //  onChanged: (val){

                          // },

                          decoration: InputDecoration(
                            prefix: Icon(Icons.tag_faces),
                            contentPadding: EdgeInsetsDirectional.all(20),
                            hintText: "Enter Task Name",
                            label: Text("Task Name"),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: dateConroller,
                        onEditingComplete: () {
                          if (taskNameConroller.text != "") {
                            Navigator.of(context).pop(dateConroller.text);
                          }
                        },

                        onTap: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse("2022-11-01"))
                              .then((value) {
                            dateConroller.text =
                                DateFormat.yMMMd().format(value!);
                          });
                        },
                        //  onChanged: (val){

                        // },

                        decoration: InputDecoration(
                          prefix: Icon(Icons.calendar_today),
                          contentPadding: EdgeInsetsDirectional.all(20),
                          hintText: "Enter Task Date",
                          label: Text("Task Date"),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: timeConroller,
                        onEditingComplete: () {
                          if (taskNameConroller.text != "") {
                            Navigator.of(context).pop(timeConroller.text);
                          }
                        },
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((value) {
                            timeConroller.text = value.toString();
                          });
                        },
                        //  onChanged: (val){

                        // },

                        decoration: InputDecoration(
                          prefix: Icon(Icons.calendar_today),
                          contentPadding: EdgeInsetsDirectional.all(20),
                          hintText: "Enter Task Time",
                          label: Text("Task Time"),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ],
                  ),
                ),
              );
              isBottomScreenShown = true;
              setState(() {
                fabIcon = Icons.add;
              });
            }
          },

          /*  () async {
            var text =
                await Navigator.of(context).pushNamed("/add_task") as String;
            setState(() {
              tasks.add(Task(taskName: text));
            });
          }*/
          child: Icon(fabIcon),
        ),
        appBar: AppBar(
          title: Text("Organize your tasks"),
          /* bottom: TabBar(
            tabs: [
              Tab(
                text: "All Tasks",
              ),
              Tab(
                text: "To Do",
              ),
              Tab(
                text: "Done",
              ),
            ],
          ),
        
        */
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cindex,
          onTap: (index) {
            setState(() {
              cindex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: "All Tasks",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm),
              label: "To Do",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.done_all_outlined),
              label: "Done",
            ),
          ],
        ),
        body: tasksScreens[cindex],

        /*  TabBarView(children: [
          ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  tasks[index].taskName,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        decoration: tasks[index].isDone
                            ? TextDecoration.lineThrough
                            : null,
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
          ToDoScreen(),
          DoneScreen(
            tasks: tasks,
          ),
        ]),
     
     
     */
      ),
    );
  }
}
