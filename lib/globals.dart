
/// Package imports
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'dart:math';


/// Lists of data
List<Appointment> schoolEvents = _getSchoolEvents();
List<Appointment> lunches = _getLunchDataSource();
List<Teacher> teachers = _getTeachers();
List<Extracurricular> extracurriculars = _getExtracurriculars();
Future<List<FAQ>> FAQs = _getFAQs();

/// API constants
class ApiConstants {
  static String baseUrl = 'https://jsonplaceholder.typicode.com';
  static String usersEndpoint = '/users';
}

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
        secondaryHeaderColor: Colors.red,
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
      firstName: "Gabrielle", lastName: "Li", email: "lig@eastonsd.org", fullName: '', id: '', suffix: ''));
  t.add(Teacher(
      firstName: "John", lastName: "Smith", email: "smithj@eastonsd.org", fullName: '', id: '', suffix: ''));
  t.add(Teacher(
      firstName: "Darius", lastName: "Collins", email: "collins@eastonsd.org", fullName: '', id: '', suffix: ''));
  t.add(Teacher(
      firstName: "Cristen", lastName: "Charnley", email: "charnleyc@eastonst.org", fullName: '', id: '', suffix: ''));
  t.add(Teacher(
      firstName: "Alex", lastName: "Hirsch", email: "hirscha@eastonsd.org", fullName: '', id: '', suffix: ''));
  t.add(Teacher(
      firstName: "Bernadette", lastName: "Varela", email: "varelab@eastonsd.org", fullName: '', id: '', suffix: ''));
  t.add(Teacher(
      firstName: "Elliot", lastName: "Cheng", email: "chenge@eastonsd.org", fullName: '', id: '', suffix: ''));
  t.add(Teacher(
      firstName: "Bethann", lastName: "Folcher", email: "folcherb@eastonsd.org", fullName: '', id: '', suffix: ''));
  t.add(Teacher(
      firstName: "James", lastName: "Hibell", email: "hibellj@eastonsd.org", fullName: '', id: '', suffix: ''));
  t.add(Teacher(
      firstName: "Amy", lastName: "Fontno", email: "fontnoa@eastonsd.org", fullName: '', id: '', suffix: ''));
  t.add(Teacher(
      firstName: "Brandon", lastName: "Kazan", email: "kazanb@eastonsd.org", fullName: '', id: '', suffix: ''));


  return t;
}

/// Gets the school events
List<Appointment> _getSchoolEvents() {
  List<Appointment> e = <Appointment>[];

  e.add(Appointment(
    startTime: DateTime(2022, 4, 16),
    endTime: DateTime(2022, 1, 16),
    subject: 'EAHS Day',
    color: Colors.lightBlue,));

  return e;
}

/// Gets the extracurriculars
List<Extracurricular> _getExtracurriculars() {
  List<Extracurricular> e = <Extracurricular>[];
  Teacher _teacher1 = Teacher(
      firstName: "Gabrielle", lastName: "Li", email: "lig@eastonsd.org", suffix: '', id: '', fullName: '');
  Teacher _teacher2 = Teacher(firstName: "Darius", lastName: "Collins", email: "collins@eastonsd.org", suffix: '', fullName: '', id: '');
  Teacher _teacher3 = Teacher(firstName: "John", lastName: "Smith", email: "smithj@eastonsd.org", id: '', fullName: '', suffix: '');
  Teacher _teacher4 = Teacher(firstName: "Bob", lastName: "Jenkins", email: "jenkinsb@gmail.com", fullName: '', id: '', suffix: '');
  Teacher _teacher5 = Teacher(firstName: "John", lastName: "Doe", email: "john.doe@aol.com", fullName: '', id: '', suffix: '');

  e.add(Extracurricular(
      name: "Future Business Leaders of America",
      room: "J121",
      teacher: _teacher1,
      meetingDays: "Tuesdays",
      description: "Future Business Leaders of America is a club that allows students to develop their business skills and experience entrepreneurship."));
  e.add(Extracurricular(
      name: "Chess Club",
      room: "J315",
      teacher: _teacher2,
      meetingDays: "Thursdays",
      description: "Chess Club is a club where students can play chess and compete in tournaments."));
  e.add(Extracurricular(
      name: "Computer Science Club",
      room: "J221",
      teacher: _teacher3,
      meetingDays: "Tuesdays",
      description: "Computer Science Club is a club that teaches students how to program in C#."));
  e.add(Extracurricular(
      name: "Asian Culture Club",
      room: "K216",
      teacher: _teacher4,
      meetingDays: "Mondays",
      description: "Asian Culture Club where students learn about Asian culture."));
  e.add(Extracurricular(
      name: "YouThink Literary Magazine",
      room: "J305",
      teacher: _teacher5,
      meetingDays: "Fridays",
      description: "YouThink Literary Magazine is a club that publishes the writing and artwork of students."));

  return e;
}

/// Class definitions

class User {
  User({
    required this.id,
    required this.username,
    required this.token
  });

  String id;
  String username;
  String token;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      token: json['token'],
    );
  }
}

class FAQ {
  FAQ({
    id,
    required this.question,
    required this.answer,
  });

  String id = '';
  String question;
  String answer;

  factory FAQ.fromJson(Map<String, dynamic> json) {
    return FAQ(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
    );
  }
}

class Teacher {
  Teacher({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.suffix,
    required this.email,
  });

  String id;
  String firstName;
  String lastName;
  String fullName;
  String suffix;
  String email;

  String getFullName() {
    return firstName + ' ' + lastName;
  }

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      fullName: json['fullName'],
      suffix: json['suffix'],
      email: json['email'],
    );
  }
}

class Extracurricular {
  Extracurricular({
    id,
    required this.name,
    room,
    required this.teacher,
    required this.meetingDays,
    required this.description,
  });

  String id = '';
  String name;
  String room = 'J' + (300 + Random().nextInt(20)).toString();
  Teacher teacher;
  String meetingDays;
  String description;

  factory Extracurricular.fromJson(Map<String, dynamic> json) {
    return Extracurricular(
      id: json['id'],
      name: json['name'],
      teacher: Teacher.fromJson(json['teacher']),
      description: json['description'],
      meetingDays: json['meetingDates'],
    );
  }
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
