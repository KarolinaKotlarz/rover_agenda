import 'package:flutter/material.dart';
import 'package:rover_agenda/email_form.dart';
import 'package:rover_agenda/schedule_form_page.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'flyout_menu.dart';
import 'globals.dart' as globals;
import 'globals.dart';

class TeacherList extends StatelessWidget {
  const TeacherList({Key? key}) : super(key: key);
  static String routeName = "/extracurriculars";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher List'),
      ),
      drawer: NavDrawer(),
      body: ListView(
        children: <Widget>[
          for(var teacher in teachers)
          Container(
            color: Colors.grey[200],
            margin: EdgeInsets.only(top: 10.0),
            child: Row(
                children:
                [
                  Expanded(
                    flex: 7,
                    child: Container(
                      //color: Colors.blue,
                      margin: EdgeInsets.only(left: 10.0, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            teacher.firstName + " " + teacher.lastName,
                          ),
                          Text(
                            teacher.email,
                          ),
                        ],
                      ),

                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.all(16.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EmailFormPage(teacher: teacher)),
                          );
                        },
                        icon: Icon(Icons.email_outlined, color: Colors.white,),
                        iconSize: 30,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                ]
            ),
          ),
        ],
      ),
    );
  }
}