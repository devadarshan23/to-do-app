import 'package:flutter/foundation.dart';
import 'package:sample/Task.dart';
class TaskData extends ChangeNotifier{
  List<Task> tasks=[
    Task(name:"math assignment")

  ];
  void addtask(String newtasktitle){
    final task =Task(name: newtasktitle);
    tasks.add(task);
    notifyListeners();
  }
  void updatetask(Task task){
    task.toggledone();
    notifyListeners();
  }
  void deletetask(Task task){
    tasks.remove(task);
    notifyListeners();

  }

}