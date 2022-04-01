import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

List<Appointment> appointments = <Appointment>[];
List<Appointment> schoolEvents = <Appointment>[];
List<Appointment> lunches = _getLunchDataSource();

List<Teacher> teachers = _getTeachers();
List<Extracurricular> extracurriculars = _getExtracurriculars();
List<Appointment> _lunches = <Appointment>[];

DateTime semesterOneStart = DateTime(2021, 8, 30);
DateTime semesterOneEnd = DateTime(2022, 1, 21);
DateTime semesterTwoStart = DateTime(2022, 1, 24);
DateTime semesterTwoEnd = DateTime(2022, 6, 6);

const String loremIpsumParagraph =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
    'tempor incididunt ut labore et dolore magna aliqua. Vulputate dignissim '
    'suspendisse in est. Ut ornare lectus sit amet. Eget nunc lobortis mattis '
    'aliquam faucibus purus in. Hendrerit gravida rutrum quisque non tellus '
    'orci ac auctor. Mattis aliquam faucibus purus in massa. Tellus rutrum '
    'tellus pellentesque eu tincidunt tortor. Nunc eget lorem dolor sed. Nulla '
    'at volutpat diam ut venenatis tellus in metus. Tellus cras adipiscing enim '
    'eu turpis. Pretium fusce id velit ut tortor. Adipiscing enim eu turpis '
    'egestas pretium. Quis varius quam quisque id. Blandit aliquam etiam erat '
    'velit scelerisque. In nisl nisi scelerisque eu. Semper risus in hendrerit '
    'gravida rutrum quisque. Suspendisse in est ante in nibh mauris cursus '
    'mattis molestie. Adipiscing elit duis tristique sollicitudin nibh sit '
    'amet commodo nulla. Pretium viverra suspendisse potenti nullam ac tortor '
    'vitae.\n'
    '\n'
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
    'tempor incididunt ut labore et dolore magna aliqua. Vulputate dignissim '
    'suspendisse in est. Ut ornare lectus sit amet. Eget nunc lobortis mattis '
    'aliquam faucibus purus in. Hendrerit gravida rutrum quisque non tellus '
    'orci ac auctor. Mattis aliquam faucibus purus in massa. Tellus rutrum '
    'tellus pellentesque eu tincidunt tortor. Nunc eget lorem dolor sed. Nulla '
    'at volutpat diam ut venenatis tellus in metus. Tellus cras adipiscing enim '
    'eu turpis. Pretium fusce id velit ut tortor. Adipiscing enim eu turpis '
    'egestas pretium. Quis varius quam quisque id. Blandit aliquam etiam erat '
    'velit scelerisque. In nisl nisi scelerisque eu. Semper risus in hendrerit '
    'gravida rutrum quisque. Suspendisse in est ante in nibh mauris cursus '
    'mattis molestie. Adipiscing elit duis tristique sollicitudin nibh sit '
    'amet commodo nulla. Pretium viverra suspendisse potenti nullam ac tortor '
    'vitae';

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
      subject: 'Quesadilla',
      color: Colors.blueGrey,
      recurrenceRule: 'FREQ=DAILY;UNTIL=20220606'
  ));

  _lunches.add(Appointment(
      startTime: DateTime(2022, 1, 16, 2),
      endTime: DateTime(2022, 1, 16, 3),
      subject: 'Salad',
      color: Colors.lightGreenAccent,
      recurrenceRule: 'FREQ=DAILY;UNTIL=20220606'
  ));

  _lunches.add(Appointment(
      startTime: DateTime(2022, 1, 16, 3),
      endTime: DateTime(2022, 1, 16, 4),
      subject: 'Tacos',
      color: Colors.pinkAccent,
      recurrenceRule: 'FREQ=DAILY;UNTIL=20220606'
  ));

  _lunches.add(Appointment(
      startTime: DateTime(2022, 1, 16, 4),
      endTime: DateTime(2022, 1, 16, 5),
      subject: 'Hamburger',
      color: Colors.yellowAccent,
      recurrenceRule: 'FREQ=DAILY;UNTIL=20220606'
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