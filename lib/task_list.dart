import 'package:flutter/material.dart';
import 'package:sample/task_tile.dart';

import 'package:provider/provider.dart';
import 'package:sample/Task_Data.dart';

class Taskslist extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(

      builder: ( BuildContext context, TaskData , child) {
         return ListView.builder(
           itemBuilder: (context, index) {
             return TaskTile(
               tasktitle: TaskData.tasks[index].name,
               ischecked:TaskData.tasks[index].isdone,
               checkboxCallback: (checkboxState) {
                 TaskData.updatetask(TaskData.tasks[index]);
               },
               longpresscallback: (){
                 TaskData.deletetask(TaskData.tasks[index]);
               },

             );
           },
           itemCount: TaskData.tasks.length,
         );

      },

    );
  }
}


