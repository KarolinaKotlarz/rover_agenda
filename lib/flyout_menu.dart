import 'package:flutter/material.dart';
import 'package:instabug_flutter/BugReporting.dart';
import 'package:rover_agenda/pages/login/login_page.dart';
import 'package:rover_agenda/pages/lunch_menu/lunch_menu_page.dart';
import 'package:rover_agenda/pages/settings/settings_page.dart';
import 'package:rover_agenda/pages/schedule/calendar/schedule_page.dart';

import 'pages/schedule/calendar/schedule_page.dart';
import 'pages/school_calendar/school_calendar.dart';
import 'pages/extracurriculars/extracurriculars_page.dart';
import 'pages/teachers/teacher_list_page.dart';

class FlyoutMenu extends StatelessWidget {
  const FlyoutMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/img/rover_agenda_icon.png'))),
          ),
          ListTile(
            leading: const Icon(Icons.book_outlined),
            title: const Text('Schedule'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SchedulePage(Key(''))),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.fastfood_outlined),
            title: const Text('Lunch Menu'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LunchMenu()),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.people_alt_outlined),
            title: const Text('Teachers'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TeacherList()),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.widgets_outlined),
            title: const Text('Extracurriculars'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Extracurriculars()),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today_sharp),
            title: const Text('School Calendar'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SchoolCalendar()),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.bug_report_outlined),
            title: const Text('Report a Bug'),
            onTap: () => {
              Navigator.of(context).pop(),
              BugReporting.show(ReportType.bug, [InvocationOption.commentFieldRequired] )
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Log Out'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              ),
            },
          ),
        ],
      ),
    );
  }
}