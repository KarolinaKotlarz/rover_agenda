import 'package:flutter/material.dart';

import 'flyout_menu.dart';
import 'globals.dart' as globals;


class FAQs extends StatelessWidget {
  const FAQs({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frequently Asked Questions'),
      ),
      body: Center(
        child: Text("Some answers"),
      ),
    );
  }
}
