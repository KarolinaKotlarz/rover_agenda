import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:flutter/material.dart';
import 'package:instabug_flutter/BugReporting.dart';
import 'package:instabug_flutter/Instabug.dart';
import 'package:rover_agenda/pages/settings/faq_page.dart';
import 'package:rover_agenda/pages/settings/privacy_policy_page.dart';

import 'change_password_form.dart';
import '../../components/flyout_menu.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);


  void initState() {
    Instabug.start('76ed198e8e1d4438e3ff5b8b152d6e60', [InvocationEvent.shake, InvocationEvent.none]);
  }

  @override
  Widget build(BuildContext context) {
    var v = true;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const FlyoutMenu(),

      body: SettingsList(
        sections: [
          SettingsSection(
            titlePadding: const EdgeInsets.all(10.0),
            title: 'ACCOUNT',
            tiles: [
              SettingsTile(
                title: 'Edit Profile',
                leading: const Icon(Icons.person_outline_sharp),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'Change Password',
                leading: const Icon(Icons.lock_outline_sharp),
                onPressed: (BuildContext context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PasswordFormPage()),
                  );
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'SUPPORT',
            titlePadding: const EdgeInsets.all(10.0),
            tiles: [
              SettingsTile(
                title: 'Report a Bug',
                leading: const Icon(Icons.error_outline_sharp),
                onPressed: (BuildContext context) {
                  BugReporting.show(ReportType.bug, [InvocationOption.commentFieldRequired] );
                  },
              ),
              SettingsTile(
                title: 'Feedback',
                leading: const Icon(Icons.feedback_outlined),
                onPressed: (BuildContext context) {
                  BugReporting.show(ReportType.feedback, [InvocationOption.commentFieldRequired] );
                },
              ),
              SettingsTile(
                title: 'FAQs',
                leading: const Icon(Icons.question_answer_outlined),
                onPressed: (BuildContext context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FAQs()),
                  );
                },
              ),
              SettingsTile(
                title: 'Ask a Question',
                leading: const Icon(Icons.question_mark_outlined),
                onPressed: (BuildContext context) {
                  BugReporting.show(ReportType.question, [InvocationOption.commentFieldRequired] );
                },
              ),
              SettingsTile(
                title: 'Privacy Policy',
                leading: const Icon(Icons.people_outline_sharp),
                onPressed: (BuildContext context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PrivacyPolicy()),
                  );
                },
              ),
            ],
          ),
        ],
      )
    );
  }
}