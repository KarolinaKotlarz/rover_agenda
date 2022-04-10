import 'package:flutter/material.dart';
import 'package:instabug_flutter/BugReporting.dart';
import 'package:rover_agenda/pages/login/login_page.dart';
import 'package:rover_agenda/pages/lunch_menu/lunch_menu_page.dart';
import 'package:rover_agenda/pages/settings/settings_page.dart';
import 'package:rover_agenda/pages/schedule/calendar/schedule_page.dart';

import '../pages/schedule/calendar/schedule_page.dart';
import '../pages/school_calendar/school_calendar.dart';
import '../pages/extracurriculars/extracurriculars_page.dart';
import '../pages/teachers/teacher_list_page.dart';

List<ListTile> getFlyoutMenuItems(BuildContext context) {
  List<ListTile> items = <ListTile>[];

  items.add(ListTile(
      leading: Icon(Icons.book_outlined),
      title: Text("Schedule"),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => SchedulePage(Key('schedule'))));
      },
      selected: false));

  items.add(ListTile(
      leading: Icon(Icons.calendar_today_outlined),
      title: Text("School Calendar"),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => SchoolCalendar()));
      },
      selected: false));

  items.add(ListTile(
    leading: const Icon(Icons.settings_outlined),
    title: const Text('Settings'),
    onTap: () =>
    {
      Navigator.of(context).pop(),
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SettingsPage()),
      ),
    },
  ));

  items.add(ListTile(
    leading: const Icon(Icons.bug_report_outlined),
    title: const Text('Report a Bug'),
    onTap: () => {
      Navigator.of(context).pop(),
      BugReporting.show(ReportType.bug, [InvocationOption.commentFieldRequired] )
    },
  ));

  items.add(ListTile(
    leading: const Icon(Icons.exit_to_app),
    title: const Text('Log Out'),
    onTap: () => {
      Navigator.of(context).pop(),
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      ),
    },
  ));
  return items;
}