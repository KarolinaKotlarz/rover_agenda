import 'package:flutter/material.dart';
import 'package:instabug_flutter/Instabug.dart';
import 'log_in/log_in_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rover Agenda',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        body: Login(),
      ),
    );
  }
}