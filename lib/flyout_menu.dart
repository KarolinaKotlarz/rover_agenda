import 'package:flutter/material.dart';
import 'package:rover_agenda/main.dart';
import 'package:rover_agenda/animation_sample.dart';
import 'package:rover_agenda/schedule.dart';

import 'calendar.dart';
import 'extracurriculars.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('images/rover_agenda_icon.png'))),
          ),
          ListTile(
            leading: Icon(Icons.book_outlined),
            title: Text('Schedule'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Schedule()),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.fastfood_outlined),
            title: Text('Lunch Menu'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OpenContainerTransformDemo()),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.people_alt_outlined),
            title: Text('Teachers'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: "Home")),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.widgets_outlined),
            title: Text('Extracurriculars'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Extracurriculars()),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today_sharp),
            title: Text('School Calendar'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Calendar()),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text('Settings'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: "Home")),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: "Home")),
              ),
            },
          ),
        ],
      ),
    );
  }
}