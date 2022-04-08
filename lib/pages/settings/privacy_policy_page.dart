import 'package:flutter/material.dart';

import '../../components/flyout_menu.dart';
import '../../globals/globals.dart' as globals;


class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: const Center(
        child: const Text("Our Privacy Policy"),
      ),
    );
  }
}
