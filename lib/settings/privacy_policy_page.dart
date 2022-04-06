import 'package:flutter/material.dart';

import '../flyout_menu.dart';
import '../globals.dart' as globals;


class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: Center(
        child: Text("Our Privacy Policy"),
      ),
    );
  }
}
