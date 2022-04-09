import 'package:flutter/material.dart';
import 'package:instabug_flutter/Instabug.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../flyout_menu.dart';
import '../../globals.dart' as globals;

class SchoolCalendar extends StatelessWidget {
  const SchoolCalendar({Key? key}) : super(key: key);
  static String routeName = "/extracurriculars";

  void initState() {
    Instabug.start('76ed198e8e1d4438e3ff5b8b152d6e60', [InvocationEvent.shake]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Calendar'),
      ),
      drawer: const FlyoutMenu(),
      body: SfCalendar(
        showDatePickerButton: true,
        view: CalendarView.month,
        showNavigationArrow: true,
        allowViewNavigation: true,
        showCurrentTimeIndicator: true,
        allowedViews: const <CalendarView>
        [
          CalendarView.day,
          CalendarView.week,
          CalendarView.month,
        ],
        monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          showAgenda: true,
        ),
        dataSource: _SchoolCalendarDataSource(globals.schoolEvents),
      ),

    );
  }
}

class _SchoolCalendarDataSource extends CalendarDataSource {
  _SchoolCalendarDataSource(List<Appointment> source) {
    appointments = source;
  }
}