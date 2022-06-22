/// Package imports
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Local imports
import '../schedule/calendar/schedule_page.dart';
import '../../globals.dart' as globals;

/// Default user logins
const users = {
  'test@gmail.com': 'test',
  "student@fbla.com": "student",
};

/// The class representing the login page
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  /// Sets login time for debugging
  Duration get loginTime => const Duration(milliseconds: 2250);

  /// Called to authenticate a user
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

  /// Called to sign up a user
  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  /// Called when the user asks to recover their password
  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User does not exist';
      }
      return 'null';
    });
  }

  /// Builds the login screen
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      theme: LoginTheme(
        titleStyle: TextStyle(fontFamily: 'Freshman'),
        pageColorDark: Color(0xFF8D0514),
        pageColorLight: Color(0xFFFF2B2B),
        buttonTheme: LoginButtonTheme(
          backgroundColor: Color(0xFFFF2B2B)
        )
      ),

      title: 'Rover Agenda',
      logo: const AssetImage('assets/images/rover_agenda_login_icon.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      loginProviders: <LoginProvider>[
      /// List of social media login buttons
        LoginProvider(
          button: Buttons.FacebookNew,
          label: "Login with Facebook",
          callback: () async {
            debugPrint('start linkedin sign in');
            await Future.delayed(loginTime);
            debugPrint('stop linkedin sign in');
            return null;
          },
        ),
        LoginProvider(
          button: Buttons.GoogleDark,
          label: "Sign in with Google",
          callback: () async {
            debugPrint('start linkedin sign in');
            await Future.delayed(loginTime);
            debugPrint('stop linkedin sign in');
            return null;
          },
        ),
        LoginProvider(
          button: Buttons.AppleDark,
          label: "Sign up with Apple",
          callback: () async {
            debugPrint('start linkedin sign in');
            await Future.delayed(loginTime);
            debugPrint('stop linkedin sign in');
            return null;
          },
        ),
      ],
      onSubmitAnimationCompleted: () {
        /// Opens the schedule page
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const SchedulePage(Key('')),
        ));
      },
      onRecoverPassword: _recoverPassword,
      messages: LoginMessages(
        /// Sets custom texts
        recoverPasswordDescription:
        'We will send you an email with a link to recover your password to this email.',
        providersTitleFirst: "or",
      ),
    );
  }
}