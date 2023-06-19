import 'package:flutter/material.dart';
import 'package:sample/task_tile.dart';
import 'package:sample/Task.dart';

class Taskslist extends StatefulWidget {
  @override
  State<Taskslist> createState() => _TaskslistState();
}

class _TaskslistState extends State<Taskslist> {

  List<Task> tasks=[
    Task(name:'Buy milks'),
    Task(name:'assignment'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            tasktitle: tasks[index].name,
            ischecked: tasks[index].isdone,
            checkboxCallback: (checkboxState) {
              setState(() {
                tasks[index].toggledone();
              });

            },
        );
      },
      itemCount: tasks.length,
    );
  }
}


