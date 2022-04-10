/// Package imports
import 'package:flutter/material.dart';
import 'package:rover_agenda/pages/settings/faq_page.dart';
/// Local imports
import 'pages/login/login_page.dart';
import '../../globals.dart' as globals;

/// Runs the app
void main() {
  runApp(const RoverAgenda());
}

/// The class representing the app
class RoverAgenda extends StatelessWidget {
  const RoverAgenda({Key? key}) : super(key: key);

  /// The root of the application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rover Agenda',
      theme: globals.roverTheme,
      home: Scaffold(
        body: Login(), /// The login page is the first thing the user should see
      ),
    );
  }
}