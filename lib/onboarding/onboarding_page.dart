import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:rover_agenda/onboarding/onboarding_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/login/login_page.dart';
import 'package:rover_agenda/globals.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() {
    return _OnboardingState();
  }
}

class _OnboardingState extends State<Onboarding>{

  final data = [
    OnboardingCardData(title: 'Welcome',
        subtitle: 'Welcome to Rover Agenda!',
        image: AssetImage('assets/images/rover_agenda_login_icon.png'),
        backgroundColor: roverTheme.primaryColor,
      titleColor: Colors.white,
      subtitleColor: Colors.white,
    ),
    OnboardingCardData(title: 'Schedule',
      subtitle: 'View your schedule and edit your classes.',
      image: AssetImage('assets/images/Onboard_Schedule.png'),
      backgroundColor: roverTheme.secondaryHeaderColor,
      titleColor: Colors.white,
      subtitleColor: Colors.white,
    ),
    OnboardingCardData(title: 'Lunch Menu',
      subtitle: 'See what\'s on the menu for this week.',
      image: AssetImage('assets/images/Onboard_Lunches.png'),
      backgroundColor: roverTheme.primaryColor,
      titleColor: Colors.white,
      subtitleColor: Colors.white,
    ),
    OnboardingCardData(title: 'Teachers',
      subtitle: 'Know your teachers and email them when you need.',
      image: AssetImage('assets/images/Onboard_Teachers.png'),
      backgroundColor: roverTheme.secondaryHeaderColor,
      titleColor: Colors.white,
      subtitleColor: Colors.white,
    ),
    OnboardingCardData(title: 'Extracurriculars',
      subtitle: 'Learn about the extracurricular activities Easton has to offer.',
      image: AssetImage('assets/images/Onboard_Extracurriculars.png'),
      backgroundColor: roverTheme.primaryColor,
      titleColor: Colors.white,
      subtitleColor: Colors.white,
    ),
    OnboardingCardData(title: 'Calendar',
      subtitle: 'Take a look at upcoming events, taken from the official school announcements.',
      image: AssetImage('assets/images/Onboard_Calendar.png'),
      backgroundColor: roverTheme.secondaryHeaderColor,
      titleColor: Colors.white,
      subtitleColor: Colors.white,
    ),
    OnboardingCardData(title: 'Bug Reporting',
      subtitle: 'Find any issues? Just let us know with a shake of your device, or use the menu.',
      image: AssetImage('assets/images/Onboard_BugReporting.png'),
      backgroundColor: roverTheme.primaryColor,
      titleColor: Colors.white,
      subtitleColor: Colors.white,
    )

  ];

  final controller = PageController();
  String buttonText = 'skip';

  void changeButton() {
    setState(() {
      buttonText = 'continue';
    });
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: TextButton(
        style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
          );

          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('showHome', true);
        },
        child: Text(buttonText.toUpperCase()),
      ),
      body: ConcentricPageView(
        pageController: controller,
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        itemBuilder: (int index) {
          return OnboardingCard(data: data[index]);
        },
        nextButtonBuilder: (context) => Padding(
          padding: const EdgeInsets.only(left: 3), // visual center
          child: Icon(
            Icons.navigate_next,
            size: _screenWidth * 0.08,
          ),
        ),
        onFinish: () {
          changeButton();
        },
        onChange: (int index) {
          if(index == data.length - 1)
            {
              changeButton();
            }
        },
      ),
    );
  }
}