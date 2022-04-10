
/// Package imports
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


/// Lists of data
List<Appointment> schoolEvents = <Appointment>[];
List<Appointment> lunches = _getLunchDataSource();
List<Teacher> teachers = _getTeachers();
List<Extracurricular> extracurriculars = _getExtracurriculars();
Future<List<FAQ>> FAQs = _getFAQs();

/// Semester start and end dates
DateTime semesterOneStart = DateTime(2021, 8, 30);
DateTime semesterOneEnd = DateTime(2022, 1, 21);
DateTime semesterTwoStart = DateTime(2022, 1, 24);
DateTime semesterTwoEnd = DateTime(2022, 6, 6);

/// Colors
final Color navBarColor = Color(0xFF8D0514);
final Color buttonColor = Colors.red;

/// App theme
final ThemeData roverTheme =
    ThemeData(
        primaryColor: navBarColor,
        primarySwatch: Colors.red,
        appBarTheme: AppBarTheme(
          color: navBarColor
        ),
      buttonTheme: ButtonThemeData(
        buttonColor: buttonColor
      ),
    );

/// Gets the lunches
List<Appointment> _getLunchDataSource() {
  List<Appointment> _lunches = <Appointment>[];

  _lunches.add(Appointment(
      startTime: DateTime(2022, 1, 16, 0),
      endTime: DateTime(2022, 1, 16, 1),
      subject: 'Pizza',
      color: Colors.blueAccent,
      recurrenceRule: 'FREQ=DAILY;COUNT=90'));

  _lunches.add(Appointment(
      startTime: DateTime(2022, 1, 16, 1),
      endTime: DateTime(2022, 1, 16, 2),
      subject: 'Quesadilla',
      color: Colors.blue,
      recurrenceRule: 'FREQ=DAILY;UNTIL=20220606'));

  _lunches.add(Appointment(
      startTime: DateTime(2022, 1, 16, 2),
      endTime: DateTime(2022, 1, 16, 3),
      subject: 'Salad',
      color: Colors.lightBlue,
      recurrenceRule: 'FREQ=DAILY;UNTIL=20220606'));

  _lunches.add(Appointment(
      startTime: DateTime(2022, 1, 16, 3),
      endTime: DateTime(2022, 1, 16, 4),
      subject: 'Tacos',
      color: Colors.lightBlueAccent,
      recurrenceRule: 'FREQ=DAILY;UNTIL=20220606'));

  _lunches.add(Appointment(
      startTime: DateTime(2022, 1, 16, 4),
      endTime: DateTime(2022, 1, 16, 5),
      subject: 'Hamburger',
      color: Colors.lightBlue,
      recurrenceRule: 'FREQ=DAILY;UNTIL=20220606'));

  return _lunches;
}

Future<List<FAQ>> _getFAQs() async {
/// Gets the FAQs
  List<FAQ> f = <FAQ>[];

  f.add(FAQ(
      question: 'How do I modify my schedule?',
      answer:
          'You can make changes to pre-existing classes by tapping on the block, or add a new class by tapping on one of the empty timeslots. From there, you will be able to edit the class’s title, color, timeframe, repetitions, and description. Hit the checkmark in the top right corner to save your changes.'));
  f.add(FAQ(
      question: 'How can I delete a class?',
      answer:
          'You can delete a class by going into the editing menu of your desired class and clicking on the blue trash can button. You will be prompted to delete either just the single instance of the class or all recurring classes.'));
  f.add(FAQ(
      question: 'How can I email my teachers/advisors?',
      answer:
          'You can contact your teachers/advisors by clicking on the red email button to the right of your desired teacher’s name. The app will redirect you to your mailing app, which will automatically open a draft to your teacher’s email.'));
  f.add(FAQ(
      question: 'How can I modify my account?',
      answer:
          'You can make changes to your account by clicking on the settings button and going to the ‘Account’ section of the page. There, you can edit your profile and change your password.'));
  f.add(FAQ(
      question: 'I forgot my password. What do I do?',
      answer:
          'You can reset your password through the ‘Forgot Password?’ button on the login page. You will be prompted to enter your account email address, and you will receive a password recovery email shortly.'));
  f.add(FAQ(
      question: 'How can I report bugs?',
      answer:
          'You can report bugs through the bug reporting feature. Navigate to settings and click on “Report a Bug” in the bottom section.'));

  return f;
}


/// Gets the teachers
List<Teacher> _getTeachers() {
  List<Teacher> t = <Teacher>[];

  t.add(Teacher(
      firstName: "Gabrielle", lastName: "Li", email: "lig@eastonsd.org"));
  t.add(Teacher(
      firstName: "John", lastName: "Smith", email: "smithj@eastonsd.org"));
  t.add(Teacher(
      firstName: "Darius", lastName: "Collins", email: "collins@eastonsd.org"));

  return t;
}

/// Gets the extracurriculars
List<Extracurricular> _getExtracurriculars() {
  List<Extracurricular> e = <Extracurricular>[];
  Teacher _teacher1 = Teacher(
      firstName: "Gabrielle", lastName: "Li", email: "lig@eastonsd.org");
  Teacher _teacher2 = Teacher(firstName: "Darius", lastName: "Collins", email: "collins@eastonsd.org");
  Teacher _teacher3 = Teacher(firstName: "John", lastName: "Smith", email: "smithj@eastonsd.org");
  Teacher _teacher4 = Teacher(firstName: "Bob", lastName: "Jenkins", email: "jenkinsb@gmail.com");
  Teacher _teacher5 = Teacher(firstName: "John", lastName: "Doe", email: "john.doe@aol.com");

  e.add(Extracurricular(
      name: "Future Business Leaders of America",
      room: "J121",
      teacher: _teacher1,
      meetingDays: "Tuesdays",
      description: "Future Business Leaders of America"));
  e.add(Extracurricular(
      name: "Chess Club",
      room: "J315",
      teacher: _teacher2,
      meetingDays: "Thursdays",
      description: "Chess Club"));
  e.add(Extracurricular(
      name: "Computer Science Club",
      room: "J221",
      teacher: _teacher3,
      meetingDays: "Tuesdays",
      description: "AP Calculus AB"));
  e.add(Extracurricular(
      name: "Asian Culture Club",
      room: "K216",
      teacher: _teacher4,
      meetingDays: "Mondays",
      description: "AP Computer Science A"));
  e.add(Extracurricular(
      name: "YouThink Literary Magazine",
      room: "J305",
      teacher: _teacher5,
      meetingDays: "Fridays",
      description: "Accounting"));

  return e;
}

/// Class definitions
class FAQ {
  FAQ({
    required this.question,
    required this.answer,
  });

  String question;
  String answer;
}

class Todo {
  Todo({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  int id;
  int userId;
  String title;
  bool completed;

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed']);
  }
}

class Teacher {
  Teacher({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  String firstName;
  String lastName;
  String email;
}

class Extracurricular {
  Extracurricular({
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


/// Placeholder text
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
