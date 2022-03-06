import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'flyout_menu.dart';
import 'globals.dart' as globals;

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);
  static String routeName = "/extracurriculars";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Calendar'),
      ),
      drawer: NavDrawer(),
      body: SfCalendar(
        showDatePickerButton: true,
        view: CalendarView.month,
        showNavigationArrow: true,
        allowViewNavigation: true,
        showCurrentTimeIndicator: true,
        allowedViews: <CalendarView>
        [
          CalendarView.day,
          CalendarView.week,
          CalendarView.month,
        ],
        monthViewSettings: MonthViewSettings(
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