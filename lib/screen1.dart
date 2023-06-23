import 'package:flutter/material.dart';
import 'package:sample/task_list.dart';
import 'package:provider/provider.dart';
import 'package:sample/Task_Data.dart';
// ignore: must_be_immutable
class screen1 extends StatefulWidget {
  const screen1({Key? key}) : super(key: key);
  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  late String newtasktitle;
  Widget buildBottomsheet(BuildContext context){

    return Container(
      color:Color(0xff757575),
      child:Container(
        padding:EdgeInsets.all(40.0),
      decoration:BoxDecoration(
        borderRadius:BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
        color:Colors.white,
      ),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.stretch ,
          children: <Widget>[
            Center(
              child: Text(
                "ADD TASK",
                textAlign: TextAlign.center,
                style:TextStyle(
                  fontSize: 30.0,
                  color:Color(0xFF075B9A),
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                autofocus: true,
                textAlign: TextAlign.center ,
                onChanged:(newtext){
                  newtasktitle=newtext;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF075B9A)),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered))
                          return Color(0xFF075B9A).withOpacity(0.04);
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed))
                          return Color(0xFF075B9A).withOpacity(0.12);
                        return null; // Defer to the widget's default.
                      },
                    ),
                  ),
                  onPressed: () {
                    Provider.of<TaskData>(context,listen: false).addtask(newtasktitle);
                    Navigator.pop(context);
                  },
                  child: Text('Add'),
              ),
            )
          ]
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF075B9A),
      floatingActionButton:FloatingActionButton(
        backgroundColor: Color(0xFF075B9A),
      child:Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(context: context, builder: buildBottomsheet);
        },
      ),

      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

              SafeArea(
                child: CircleAvatar(
                  child: Icon(
                      Icons.list,
                    size:30.0,

                  ),
                  radius:30.0 ,


                ),
              ),
           SizedBox(
             height:10.0,
           ),
          Expanded(
            child:Container(
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Taskslist(),
            ),
          ),
                    ]
                ),
        );
  }
}

