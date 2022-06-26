/// Package imports
import 'package:flutter/material.dart';
import 'package:rover_agenda/onboarding/onboarding_page.dart';
import 'package:rover_agenda/pages/schedule/calendar/schedule_page.dart';
import 'package:rover_agenda/pages/settings/faq_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
/// Local imports
import 'pages/login/login_page.dart';
import '../../globals.dart' as globals;

/// Runs the app
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showOnboarding = prefs.getBool('showOnboarding') ?? true;
  final showLogin = prefs.getBool('showLogin') ?? true;

  runApp(RoverAgenda(showOnboading: showOnboarding, showLogin: showLogin,));
}

/// The class representing the app
class RoverAgenda extends StatelessWidget {
  const RoverAgenda({Key? key, required this.showOnboading, required this.showLogin}) : super(key: key);

  /// Determines whether to show the onboarding screen
  final bool showOnboading;
  final bool showLogin;

  /// The root of the application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rover Agenda',
      theme: globals.roverTheme,
      home: Scaffold(
        body: _getBody() /// Gets the appropriate screen
      ),
    );
  }

  Widget _getBody() {
    if(showOnboading)
      {
        return Onboarding();
      }
    else if(showLogin)
      {
        return Login();
      }
    return SchedulePage(Key('schedule'));
  }
}