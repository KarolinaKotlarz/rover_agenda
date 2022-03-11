import 'package:syncfusion_flutter_calendar/calendar.dart';

List<Appointment> appointments = <Appointment>[];
List<Appointment> schoolEvents = <Appointment>[];
List<Teacher> teachers = _getTeachers();

List<Teacher> _getTeachers() {
  List<Teacher> t = <Teacher>[];

  t.add(Teacher(firstName: "Gabrielle", lastName: "Li", email: "lig@eastonsd.org"));
  t.add(Teacher(firstName: "John", lastName: "Smith", email: "smithj@eastonsd.org"));
  t.add(Teacher(firstName: "Darius", lastName: "Collins", email: "collins@eastonsd.org"));

  return t;
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