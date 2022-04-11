/// Dart imports
import 'dart:async';

/// Package imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


/// The class representing the privacy policy page
class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

/// Represents the state class of PrivacyPolicyState
class _PrivacyPolicyState extends State<PrivacyPolicy> {
  /// Gets the data from the privacy policy file
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
            future: getFileData('assets/documents/privacy_policy.txt'),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              /// Displays the privacy policy or 'Loading...' text
              if (snapshot.hasData) {
                final theText = snapshot.data;
                return Text(theText!);
              } else {
                return Text('Loading...');
              }
            },
          )
        ),
      )
    );
  }
}
