/// Package imports
import 'package:flutter/material.dart';

/// Local imports
import 'email_form_page.dart';
import '../../components/flyout_menu.dart';
import '../../globals.dart' as globals;

/// The class representing the teachers list page
class TeacherList extends StatelessWidget {
  const TeacherList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher List'),
      ),
      drawer: const FlyoutMenu(),
      body: ListView(
        children: <Widget>[
          /// Loops through the list of teachers in globals to display all of them
          for (var teacher in globals.teachers)
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/placeholder_image.png'),
              ),
              title: Text(
                teacher.firstName + " " + teacher.lastName,
              ),
              subtitle: Text(teacher.email),
              trailing: /*Icon(Icons.email_outlined, color: Colors.red, size: 40,)*/ Container(
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EmailFormPage(teacher: teacher)),
                    );
                  },
                  icon: const Icon(
                    Icons.email_outlined,
                    color: Colors.red,
                  ),
                  iconSize: 30,
                ),
                decoration: const BoxDecoration(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(30.0)),
                ),
              ),
              onTap: () {
                Text('Another data');
              },
            ),
          /*Container(
            color: Colors.grey[200],
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
              children:
              [
                /// Teacher details
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
                /// Button opening the email form page
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
          ),*/
        ],
      ),
    );
  }
}
