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
    OnboardingCardData(title: 'Welcome to Rover Agenda',
        subtitle: 'Organize your school life with us!',
        image: AssetImage('assets/images/rover_agenda_login_icon.png'),
        backgroundColor: roverTheme.primaryColor,
      titleColor: Colors.white,
      subtitleColor: Colors.white,
    ),
    OnboardingCardData(title: 'See Your Schedule',
      subtitle: 'Input and edit classes, keep track of sports practices, and remember about club meetings',
      image: AssetImage('assets/images/Onboard_Schedule.png'),
      backgroundColor: Colors.white,
      titleColor: roverTheme.primaryColor,
      subtitleColor: roverTheme.primaryColor,
    ),
    OnboardingCardData(title: 'Peek into the Cafeteria',
      subtitle: 'See what\'s on the menu for this week',
      image: AssetImage('assets/images/Onboard_Lunches.png'),
      backgroundColor: roverTheme.primaryColor,
      titleColor: Colors.white,
      subtitleColor: Colors.white,
    ),
    OnboardingCardData(title: 'Find Your Teachers',
      subtitle: 'Easily look up teachers and email them with the click of a button',
      image: AssetImage('assets/images/Onboard_Teachers.png'),
      backgroundColor: Colors.white,
      titleColor: roverTheme.primaryColor,
      subtitleColor: roverTheme.primaryColor,
    ),
    OnboardingCardData(title: 'Want to Join a Club?',
      subtitle: 'Find information about all the activities Easton has to offer under the Extracurriculars tab',
      image: AssetImage('assets/images/Onboard_Extracurriculars.png'),
      backgroundColor: roverTheme.primaryColor,
      titleColor: Colors.white,
      subtitleColor: Colors.white,
    ),
    OnboardingCardData(title: 'When\'s the next football game?',
      subtitle: 'Don\'t miss any important school events! Find information about games, prom, graduation, and more under the School Calendar tab',
      image: AssetImage('assets/images/Onboard_Calendar.png'),
      backgroundColor: Colors.white,
      titleColor: roverTheme.primaryColor,
      subtitleColor: roverTheme.primaryColor,
    ),
    OnboardingCardData(title: 'Notice any Bugs?',
      subtitle: 'Trigger the bug reporting form with a shake of your device, or click the button on the flyout menu',
      image: AssetImage('assets/images/Onboard_BugReporting.png'),
      backgroundColor: roverTheme.primaryColor,
      titleColor: Colors.white,
      subtitleColor: Colors.white,
    )

  ];

  final controller = PageController();
  String buttonText = 'skip';
  Color buttonColor = Colors.white;
  bool isWhite = true;

  void changeButton() {
    setState(() {
      buttonText = 'continue';
    });
  }

  void changeButtonColor()
  {
    setState(() {
      if(isWhite) {
        buttonColor = roverTheme.primaryColor;
      }
      else {
        buttonColor = Colors.white;
      }
      isWhite = !isWhite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: TextButton(
        style: ButtonStyle(foregroundColor: MaterialStateProperty.all(buttonColor)),
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );

          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('showOnboarding', false);
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
          changeButtonColor();
          if(index == data.length - 1)
            {
              changeButton();
            }
        },
      ),
    );
  }
}