import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:rover_agenda/onboarding/onboarding_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/login/login_page.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() {
    return _OnboardingState();
  }
}

class _OnboardingState extends State<Onboarding>{

  final data = [
    OnboardingCardData(title: 'title',
        subtitle: 'subtitle',
        image: AssetImage('assets/images/rover_agenda_login_icon.png'),
        backgroundColor: Colors.grey,
        titleColor: Colors.red,
        subtitleColor: Colors.redAccent,
    ),
    OnboardingCardData(title: 'title',
      subtitle: 'subtitle',
      image: AssetImage('assets/images/rover_agenda_login_icon.png'),
      backgroundColor: Colors.white,
      titleColor: Colors.red,
      subtitleColor: Colors.redAccent,
    ),
    OnboardingCardData(title: 'title',
      subtitle: 'subtitle',
      image: AssetImage('assets/images/rover_agenda_login_icon.png'),
      backgroundColor: Colors.grey,
      titleColor: Colors.red,
      subtitleColor: Colors.redAccent,
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