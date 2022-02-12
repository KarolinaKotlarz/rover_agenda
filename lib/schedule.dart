import 'package:flutter/material.dart';
import 'package:rover_agenda/schedule_form.dart';
import 'package:rover_agenda/schedule_form_page.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'flyout_menu.dart';

class Schedule extends StatelessWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: SfCalendar(
          view: CalendarView.workWeek,
          timeSlotViewSettings: TimeSlotViewSettings(
            timeInterval: Duration(minutes: 30), timeFormat: 'h:mm',
            startHour: 7,
            endHour: 15,
          ),
          dataSource: _getCalendarDataSource(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ScheduleFormPage()),
          );
        },
        tooltip: 'Edit',
        child: Icon(Icons.edit_outlined),
      ),
    );
  }
}

_AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];

  DateTime exceptionDate = DateTime(2019, 12, 20);
  appointments.add(Appointment(
      startTime: DateTime(2022, 1, 16, 7, 20),
      endTime: DateTime(2022, 1, 16, 8, 38),
      subject: 'Block 1\nMath\nMrs. Smith\nE111',
      color: Colors.lightBlue,
      recurrenceRule: 'FREQ=DAILY;COUNT=90'
      ));

  appointments.add(Appointment(
      startTime: DateTime(2022, 1, 16, 8, 38),
      endTime: DateTime(2022, 1, 16, 9, 34),
      subject: 'Block 1\nMath\nMrs. Smith\nE111',
      color: Colors.lightBlue,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=2;UNTIL=20220606'
  ));

  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

List<TimeRegion> _getTimeRegions() {
  final List<TimeRegion> regions = <TimeRegion>[];
  regions.add(TimeRegion(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(hours: 1)),
      enablePointerInteraction: false,
      color: Colors.grey.withOpacity(0.2),
      text: 'Break'));

  return regions;
}