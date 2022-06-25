/// Package imports

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rover_agenda/http_api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
   Login({Key? key}) : super(key: key);

  final HttpApiClient _httpApiClient = HttpApiClient();
   GoogleSignIn _googleSignIn = GoogleSignIn(
     scopes: [
       'email',
     ],
   );



  /// Sets login time for debugging
  Duration get loginTime => const Duration(milliseconds: 2250);

  /// Called to authenticate a user
  Future<String?> _authUser(LoginData data) async {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    //get response from ApiClient
    try {
      var user = await _httpApiClient.login(
        'admin',
        data.password,
      );

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', user.token);
      prefs.setString('userId', user.id);
      prefs.setString('username', user.username);
    }
    on Exception catch (_) {
      return 'Error Authenticating User';
    }



    //ScaffoldMessenger.of(context).hideCurrentSnackBar();

    //if there is no error, get the user's accesstoken and pass it to HomeScreen
    /*if (res['ErrorCode'] == null) {
      String accessToken = res['access_token'];
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(accesstoken: accessToken)));
    } else {
      //if an error occurs, show snackbar with error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: ${res['Message']}'),
        backgroundColor: Colors.red.shade300,
      ));
    }*/
    return null;
    /*return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User does not exist';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });*/
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
      userType: LoginUserType.name,
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
            try {
              await _googleSignIn.signIn();
            } catch (error) {
              return error.toString();
            }
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