import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:rover_agenda/schedule.dart';
import 'package:rover_agenda/syncfusion/lib2/samples/calendar/recurrence.dart';
import 'globals.dart' as globals;

const users = const {
  'test@gmail.com': 'test',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User does not exist';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User does not exist';
      }
      return 'null';
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Rover Agenda',
      logo: AssetImage('images/rover_agenda_icon.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => RecurrenceCalendar(Key('')),
        ));
      },
      onRecoverPassword: _recoverPassword,
      messages: LoginMessages(

      ),
    );
  }
}