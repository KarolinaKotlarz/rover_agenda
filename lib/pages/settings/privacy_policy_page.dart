import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import '../../components/flyout_menu.dart';
import '../../globals/globals.dart' as globals;

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  Future<String> getFileData(String path) async {
    final String data = await rootBundle.loadString(path);
    return data;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: FutureBuilder<String>(
            future: getFileData('assets/placeholder.txt'),
            builder:
            (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                final theText = snapshot.data;
                return Text(theText!);
              } else {
                return Text('loading...');
              }
            },
          )
        ),
      )
    );
  }
}
