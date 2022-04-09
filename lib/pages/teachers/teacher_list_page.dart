import 'package:flutter/material.dart';
import 'package:rover_agenda/pages/teachers/email_form_page.dart';
import '../../components/flyout_menu.dart';
import '../../globals.dart' as globals;

class TeacherList extends StatelessWidget {
  const TeacherList({Key? key}) : super(key: key);
  static String routeName = "/extracurriculars";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher List'),
      ),
      drawer: const FlyoutMenu(),
      body: ListView(
        children: <Widget>[
          for(var teacher in globals.teachers)
          Container(
            color: Colors.grey[200],
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
                children:
                [
                  Expanded(
                    flex: 7,
                    child: Container(
                      //color: Colors.blue,
                      margin: const EdgeInsets.only(left: 10.0, right: 10),
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
                      margin: const EdgeInsets.all(16.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EmailFormPage(teacher: teacher)),
                          );
                        },
                        icon: const Icon(Icons.email_outlined, color: Colors.white,),
                        iconSize: 30,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
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