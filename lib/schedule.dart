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