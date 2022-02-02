import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'flyout_menu.dart';

class Extracurriculars extends StatelessWidget {
  const Extracurriculars({Key? key}) : super(key: key);
  static String routeName = "/extracurriculars";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extracurriculars'),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
        ),
      ),
    );
  }
}