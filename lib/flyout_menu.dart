import 'package:flutter/material.dart';
import 'package:rover_agenda/log_in/log_in_page.dart';
import 'package:rover_agenda/lunch_menu/lunch_menu_page.dart';
import 'package:rover_agenda/settings/settings_page.dart';
import 'package:rover_agenda/schedule/calendar/recurrence.dart';

import 'school_calendar/school_calendar.dart';
import 'extracurriculars/extracurriculars_page.dart';
import 'teachers/teacher_list_page.dart';

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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SchedulePage(Key(''))),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.fastfood_outlined),
            title: Text('Lunch Menu'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LunchMenu()),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.people_alt_outlined),
            title: Text('Teachers'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => TeacherList()),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.widgets_outlined),
            title: Text('Extracurriculars'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.pushReplacement(
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
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SchoolCalendar()),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text('Settings'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log Out'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              ),
            },
          ),
        ],
      ),
    );
  }
}