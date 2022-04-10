import 'package:flutter/material.dart';
import 'package:instabug_flutter/BugReporting.dart';
import 'package:rover_agenda/components/flyout_menu_list.dart';
import 'package:rover_agenda/pages/login/login_page.dart';
import 'package:rover_agenda/pages/lunch_menu/lunch_menu_page.dart';
import 'package:rover_agenda/pages/settings/settings_page.dart';
import 'package:rover_agenda/pages/schedule/calendar/schedule_page.dart';

import '../pages/schedule/calendar/schedule_page.dart';
import '../pages/school_calendar/school_calendar.dart';
import '../pages/extracurriculars/extracurriculars_page.dart';
import '../pages/teachers/teacher_list_page.dart';
import '../../globals.dart' as globals;


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
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/navbar_icon.png'))),
          ),
          ...getFlyoutMenuItems(context)
        ],
      ),
    );
  }
}