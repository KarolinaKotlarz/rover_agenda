import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:flutter/material.dart';

import 'flyout_menu.dart';

class SettingsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var v = true;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: NavDrawer(),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'ACCOUNT',
            tiles: [
              SettingsTile(
                title: 'Edit Profile',
                leading: Icon(Icons.person_outline_sharp),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'Change Password',
                leading: Icon(Icons.lock_outline_sharp),
                onPressed: (BuildContext context) {

                },
              ),
            ],
          ),
          SettingsSection(
            title: 'NOTIFICATIONS',
            tiles: [
              SettingsTile.switchTile(
                title: 'Push Notifications',
                leading: Icon(Icons.person_outline_sharp),
                switchValue: v,
                onToggle: (bool value) {},
              ),
              SettingsTile.switchTile(
                title: 'Email Notifications',
                leading: Icon(Icons.person_outline_sharp),
                switchValue: v,
                onToggle: (bool value) {
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'SUPPORT',
            tiles: [
              SettingsTile(
                title: 'Report a Bug',
                leading: Icon(Icons.error_outline_sharp),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'Privacy Policy',
                leading: Icon(Icons.people_outline_sharp),
                onPressed: (BuildContext context) {

                },
              ),
              SettingsTile(
                title: 'FAQs',
                leading: Icon(Icons.question_answer_outlined),
                onPressed: (BuildContext context) {

                },
              ),
            ],
          ),
        ],
      )
    );
  }
}