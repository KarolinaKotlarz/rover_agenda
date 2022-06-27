
/// Package imports
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';


/// Lists of data
List<Image> teacherImages = _getTeacherImages();
List<String> clubImages = _getClubImages();


List<Image> _getTeacherImages() {
  List<Image> _teacherImages = <Image>[];

  return _teacherImages;
}

List<String> _getClubImages() {
  List<String> _clubImages = <String>[];

  _clubImages.add('assets/extracurriculars/TabletopClub.jpg');
  _clubImages.add('assets/extracurriculars/FBLA.jpg');
  _clubImages.add('assets/extracurriculars/AsianCultureClub.jpg');
  _clubImages.add('assets/extracurriculars/NAHS.jpg');
  _clubImages.add('assets/extracurriculars/ChessClub.jpg');
  _clubImages.add('assets/extracurriculars/CSClub.jpg');



  return _clubImages;
}

/// API constants
class ApiConstants {
  static String baseUrl = 'https://jsonplaceholder.typicode.com';
  static String usersEndpoint = '/users';
}

/// Semester start and end dates
DateTime semesterOneStart = DateTime(2021, 8, 30);
DateTime semesterOneEnd = DateTime(2022, 1, 21);
DateTime semesterTwoStart = DateTime(2022, 1, 24);
DateTime semesterTwoEnd = DateTime(2022, 1, 25);

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

/// Class definitions
class LunchMenuItem {
  LunchMenuItem({
    id,
    required this.startTime,
    required this.endTime,
    required this.itemName,
    color
  });

  String id = '';
  DateTime startTime;
  DateTime endTime;
  String itemName;
  Color color = Colors.black;

  factory LunchMenuItem.fromJson(Map<String, dynamic> json) {
    return LunchMenuItem(
      id: json['id'],
      startTime: DateFormat("yyyy-MM-ddTHH:mm:ss").parse((json['startTime'])),
      endTime: DateFormat("yyyy-MM-ddTHH:mm:ss").parse((json['endTime'])),
      itemName: json['name'],
    );
  }
}

class SchoolEvent {
  SchoolEvent({
    id,
    required this.startTime,
    required this.endTime,
    required this.subject,
    required this.description
  });

  String id = '';
  DateTime startTime;
  DateTime endTime;
  String subject;
  String description;

  factory SchoolEvent.fromJson(Map<String, dynamic> json) {
    return SchoolEvent(
      id: json['id'],
      startTime: DateFormat("yyyy-MM-ddTHH:mm:ss").parse((json['startTime'])),
      endTime: DateFormat("yyyy-MM-ddTHH:mm:ss").parse((json['endTime'])),
      subject: json['name'],
      description: json['description']
    );
  }
}

class Block {
  Block({
    id,
    required this.startTime,
    required this.endTime,
    required this.subject,
    required this.teacher,
    color
  });

  String id = '';
  DateTime startTime;
  DateTime endTime;
  String subject;
  Teacher teacher;
  Color color = Colors.black;

  factory Block.fromJson(Map<String, dynamic> json) {
    return Block(
      id: json['id'],
      startTime: DateFormat("yyyy-MM-ddTHH:mm:ss").parse((json['startTime'])),
      endTime: DateFormat("yyyy-MM-ddTHH:mm:ss").parse((json['endTime'])),
      teacher: Teacher.fromJson(json['teacher']),
      subject: json['name'],
    );
  }
}

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
    required this.prefix,
    required this.department,
    required this.email,
    required this.imagePath
  });

  String id;
  String firstName;
  String lastName;
  String fullName;
  String prefix;
  String department;
  String email;
  String imagePath;
  //Image image = Image(image: AssetImage('images/icons/PersonF'));

  String getFullName() {
    return firstName + ' ' + lastName;
  }

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      fullName: json['fullName'],
      prefix: json['prefix'],
      department: json['department'],
      imagePath: json['suffix'],
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
    assetImage,
  });

  String id = '';
  String name;
  String room = 'J' + (300 + Random().nextInt(20)).toString();
  Teacher teacher;
  String meetingDays;
  String description;
  AssetImage assetImage = AssetImage('assets/extracurriculars/FBLA.jpg');

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