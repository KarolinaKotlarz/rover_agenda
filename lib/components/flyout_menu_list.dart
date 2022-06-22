import 'package:flutter/material.dart';
import 'package:instabug_flutter/BugReporting.dart';
import 'package:intl/intl.dart';
import 'package:rover_agenda/onboarding/onboarding_page.dart';
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
      title: Text(DateFormat.yMMMMEEEEd().format(DateTime.now()), style: TextStyle(fontSize: 17)),
      selected: false));
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
      leading: Icon(Icons.fastfood_outlined),
      title: Text("Lunch Menu"),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => LunchMenu()));
      },
      selected: false));
  items.add(ListTile(
      leading: Icon(Icons.people_alt_outlined),
      title: Text("Teachers"),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => TeacherList()));
      },
      selected: false));

  items.add(ListTile(
      leading: Icon(Icons.widgets_outlined),
      title: Text("Extracurriculars"),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Extracurriculars()));
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

  items.add(ListTile(
    leading: const Icon(Icons.exit_to_app),
    title: const Text('Log Out to Onboarding'),
    onTap: () => {
      Navigator.of(context).pop(),
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Onboarding()),
      ),
    },
  ));
  return items;
}
