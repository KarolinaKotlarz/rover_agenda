import 'package:flutter/material.dart';
import 'package:rover_agenda/schedule_form.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'flyout_menu.dart';

class ScheduleFormPage extends StatelessWidget {
  const ScheduleFormPage({Key? key}) : super(key: key);
  static String routeName = "/extracurriculars";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Calendar'),
      ),
      drawer: NavDrawer(),
      body: ScheduleForm()
    );
  }
}