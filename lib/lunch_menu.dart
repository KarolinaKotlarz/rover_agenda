import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'flyout_menu.dart';
import 'globals.dart' as globals;

class LunchMenu extends StatelessWidget {
  const LunchMenu({Key? key}) : super(key: key);
  static String routeName = "/extracurriculars";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lunch Menu'),
      ),
      drawer: NavDrawer(),
      body: SfCalendar(
        showDatePickerButton: true,
        view: CalendarView.day,
        showNavigationArrow: true,
        showCurrentTimeIndicator: false,
        timeSlotViewSettings: TimeSlotViewSettings(
          timeRulerSize: 0,
          endHour: 10,
          timeIntervalHeight: -1,
        ),
        dataSource: _LunchDataSource(globals.lunches),
      ),

    );
  }
}

class _LunchDataSource extends CalendarDataSource {
  _LunchDataSource(List<Appointment> source) {
    appointments = source;
  }
}