import 'package:flutter/material.dart';


class TaskTile extends StatelessWidget {
final bool ischecked;
final String tasktitle;
final ValueChanged<bool?> checkboxCallback;
final  GestureLongPressCallback?  longpresscallback;


 TaskTile({required this.tasktitle, required this.ischecked ,required this.checkboxCallback,required this.longpresscallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:Text(
        tasktitle,
        style: TextStyle(
        decoration: ischecked ? TextDecoration.lineThrough : null),
    ),
      onLongPress: longpresscallback,
    trailing: Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: ischecked,
      onChanged:(newvalue){
        checkboxCallback(newvalue);
      },


    )
    );

}}
