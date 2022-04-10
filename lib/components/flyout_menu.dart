/// Package imports
import 'package:flutter/material.dart';
import 'package:instabug_flutter/BugReporting.dart';

/// Local imports
import '../pages/login/login_page.dart';
import '../pages/lunch_menu/lunch_menu_page.dart';
import '../pages/settings/settings_page.dart';
import '../pages/schedule/calendar/schedule_page.dart';
import '../pages/school_calendar/school_calendar.dart';
import '../pages/extracurriculars/extracurriculars_page.dart';
import '../pages/teachers/teacher_list_page.dart';

/// The class representing the flyout menu
class FlyoutMenu extends StatelessWidget {
  const FlyoutMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          /// Image with logo
          const DrawerHeader(
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/navbar_icon.png'))),
          ),
          /// List of tiles
          ListTile(
            leading: const Icon(Icons.book_outlined),
            title: const Text('Schedule'),
            onTap: () => {
              /// Opens the selected page
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
              /// Opens the selected page
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
              /// Opens the selected page
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
              /// Opens the selected page
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
              /// Opens the selected page
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
              /// Opens the selected page
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
              /// Opens the bug reporting screen
              Navigator.of(context).pop(),
              BugReporting.show(ReportType.bug, [InvocationOption.commentFieldRequired] )
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Log Out'),
            onTap: () => {
              /// Logs the user out
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