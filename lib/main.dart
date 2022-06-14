/// Package imports
import 'package:flutter/material.dart';
import 'package:rover_agenda/onboarding/onboarding_page.dart';
import 'package:rover_agenda/pages/settings/faq_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
/// Local imports
import 'pages/login/login_page.dart';
import '../../globals.dart' as globals;

/// Runs the app
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(RoverAgenda(showHome: showHome));
}

/// The class representing the app
class RoverAgenda extends StatelessWidget {
  const RoverAgenda({Key? key, required this.showHome}) : super(key: key);

  /// Determines whether to show the home page or the onboarding screen
  final bool showHome;

  /// The root of the application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rover Agenda',
      theme: globals.roverTheme,
      home: Scaffold(
        //body: Login(), /// The login page is the first thing the user should see
        body: showHome ? Login() : Onboarding(),
      ),
    );
  }
}