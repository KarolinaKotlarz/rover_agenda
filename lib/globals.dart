import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

List<Appointment> appointments = <Appointment>[];
List<Appointment> schoolEvents = <Appointment>[];
List<Appointment> lunches = _getLunchDataSource();

List<Teacher> teachers = _getTeachers();
List<Extracurricular> extracurriculars = _getExtracurriculars();
List<Appointment> _lunches = <Appointment>[];

List<Appointment> _getLunchDataSource() {

  _lunches.add(Appointment(
      startTime: DateTime(2022, 1, 16, 0),
      endTime: DateTime(2022, 1, 16, 1),
      subject: 'Pizza',
      color: Colors.lightBlue,
      recurrenceRule: 'FREQ=DAILY;COUNT=90'
  ));

  _lunches.add(Appointment(
      startTime: DateTime(2022, 1, 16, 1),
      endTime: DateTime(2022, 1, 16, 2),
      subject: 'Salad',
      color: Colors.lightGreenAccent,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=2;UNTIL=20220606'
  ));

  return _lunches;
}

List<Teacher> _getTeachers() {
  List<Teacher> t = <Teacher>[];

  t.add(Teacher(firstName: "Gabrielle", lastName: "Li", email: "lig@eastonsd.org"));
  t.add(Teacher(firstName: "John", lastName: "Smith", email: "smithj@eastonsd.org"));
  t.add(Teacher(firstName: "Darius", lastName: "Collins", email: "collins@eastonsd.org"));

  return t;
}

List<Extracurricular> _getExtracurriculars() {
  List<Extracurricular> e = <Extracurricular>[];
  Teacher _teacher1 = Teacher(firstName: "Gabrielle", lastName: "Li", email: "lig@eastonsd.org");
  //Teacher _teacher2 = Teacher(firstName: "Darius", lastName: "Collins", email: "collins@eastonsd.org");

  e.add(Extracurricular(name: "FBLA", room: "J121", teacher: _teacher1, meetingDays: "Tuesdays", description: "Future Business Leaders of America"));

  return e;
}

class Teacher {
  Teacher ({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  String firstName;
  String lastName;
  String email;
}

class Extracurricular {
  Extracurricular ({
    required this.name,
    required this.room,
    required this.teacher,
    required this.meetingDays,
    required this.description,
  });

  String name;
  String room;
  Teacher teacher;
  String meetingDays;
  String description;
}