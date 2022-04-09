import 'package:flutter/material.dart';
import 'pages/login/login_page.dart';

void main() {
  runApp(const RoverAgenda());
}

class RoverAgenda extends StatelessWidget {
  const RoverAgenda({Key? key}) : super(key: key);

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