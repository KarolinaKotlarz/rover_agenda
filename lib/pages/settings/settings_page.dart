/// Package imports
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:flutter/material.dart';
import 'package:instabug_flutter/BugReporting.dart';
import 'package:instabug_flutter/Instabug.dart';
import 'package:rover_agenda/globals.dart' as globals;
import 'package:rover_agenda/onboarding/onboarding_page.dart';
import 'package:rover_agenda/pages/settings/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Local imports
import 'faq_page.dart';
import 'privacy_policy_page.dart';
import 'change_password_form.dart';
import '../../components/flyout_menu.dart';

/// The class representing the settings page
class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const FlyoutMenu(),

      body: SettingsList(
        sections: [
          /// Account section
          SettingsSection(
            titlePadding: const EdgeInsets.all(10.0),
            title: 'ACCOUNT',
            tiles: [
              SettingsTile(
                title: 'Edit Profile',
                leading: const Icon(Icons.person_outline_sharp),
                onPressed: (BuildContext context) async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showOnboarding', true);
                  prefs.setBool('showLogin', true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Onboarding()),
                  );
                },
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
          /// Support section
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
                leading: const Icon(Icons.add),
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