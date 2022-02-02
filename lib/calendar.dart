import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'flyout_menu.dart';

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
        view: CalendarView.month,
        monthViewSettings: MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          showAgenda: true,
        ),
      ),

    );
  }
}