import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Block {
  Block(
          {
            this.subject = 'Class',
            this.teacher = 'Teacher',
            this.room = 'Room #',
            required this.from,
            required this.to,
            required this.background,
            this.recurrenceRule
          }
        );

  String subject;
  String teacher;
  String room;
  DateTime from;
  DateTime to;
  Color background;
  String? recurrenceRule;
}

@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      body: Container(
        child: SfCalendar(
          view: CalendarView.week,
          dataSource: _getCalendarDataSource(),
        ),
      ),
    ),
  );
}

BlockDataSource _getCalendarDataSource() {
  List<Block> meetings = <Block>[];
  meetings.add(Block(
      from: DateTime(2019, 12, 18, 10),
      to: DateTime(2019, 12, 18, 12),
      background: Colors.green,
      recurrenceRule: 'FREQ=WEEKLY;BYDAY=MO,WE,FR;INTERVAL=1;COUNT=10'));
  return BlockDataSource(meetings);
}

class BlockDataSource extends CalendarDataSource {
  BlockDataSource(List<Block> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  String getRecurrenceRule(int index) {
    return appointments![index].recurrenceRule;
  }
}

String s = SfCalendar.generateRRule(recurrence,
DateTime(2019, 12, 16, 10), DateTime(2019, 12, 16, 12));

RecurrenceProperties recurrence =
  RecurrenceProperties(startDate: DateTime.now());
recurrence.recurrenceType = RecurrenceType.daily;
recurrence.interval = 2;
recurrence.recurrenceRange = RecurrenceRange.count;
recurrence.recurrenceCount = 10;

DataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];
  RecurrenceProperties recurrence =
  RecurrenceProperties(startDate: DateTime.now());
  recurrence.recurrenceType = RecurrenceType.daily;
  recurrence.interval = 2;
  recurrence.recurrenceRange = RecurrenceRange.count;
  recurrence.recurrenceCount = 10;
  appointments.add(
      Appointment(
          startTime: DateTime.now(),
          endTime: DateTime.now().add(
              Duration(hours: 2)),
          isAllDay: true,
          subject: 'Meeting',
          color: Colors.blue,
          startTimeZone: '',
          endTimeZone: '',
          recurrenceRule: SfCalendar.generateRRule(recurrence,
              DateTime.now(), DateTime.now().add(Duration(hours: 2)))
      ));

  return DataSource(appointments);
}