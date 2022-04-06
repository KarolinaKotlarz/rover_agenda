import 'package:animations/animations.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:flutter/material.dart';
import 'package:rover_agenda/settings/faq_page.dart';
import 'package:rover_agenda/settings/privacy_policy_page.dart';

import 'change_password_form.dart';
import '../flyout_menu.dart';

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PasswordFormPage()),
                  );
                },
              ),
            ],
          ),
          // SettingsSection(
          //   title: 'NOTIFICATIONS',
          //   tiles: [
          //     SettingsTile.switchTile(
          //       title: 'Push Notifications',
          //       leading: Icon(Icons.person_outline_sharp),
          //       switchValue: v,
          //       onToggle: (bool value) {},
          //     ),
          //     SettingsTile.switchTile(
          //       title: 'Email Notifications',
          //       leading: Icon(Icons.person_outline_sharp),
          //       switchValue: v,
          //       onToggle: (bool value) {
          //       },
          //     ),
          //   ],
          // ),
          SettingsSection(
            title: 'SUPPORT',
            tiles: [
              SettingsTile(
                title: 'Report a Bug',
                leading: Icon(Icons.error_outline_sharp),
                onPressed: (BuildContext context) {

                },
              ),
              SettingsTile(
                title: 'Privacy Policy',
                leading: Icon(Icons.people_outline_sharp),
                onPressed: (BuildContext context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrivacyPolicy()),
                  );
                },
              ),
              SettingsTile(
                title: 'FAQs',
                leading: Icon(Icons.question_answer_outlined),
                onPressed: (BuildContext context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FAQs()),
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

Widget _privacy()
{
  return OpenContainer<bool>(
    transitionType: ContainerTransitionType.fade,
    openBuilder: (BuildContext _, VoidCallback openContainer) {
      return _DetailsPage();
    },
    tappable: false,
    closedShape: const RoundedRectangleBorder(),
    closedElevation: 0.0,
    closedBuilder: (BuildContext _, VoidCallback openContainer) {
      return SettingsTile(
        title: 'Report a Bug',
        leading: Icon(Icons.error_outline_sharp),
        onPressed: (BuildContext context) {

        },
      );
    },
  );
}

class _DetailsPage extends StatelessWidget {
  const _DetailsPage({this.includeMarkAsDoneButton = false});

  final bool includeMarkAsDoneButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details page'),
        actions: <Widget>[
          if (includeMarkAsDoneButton)
            IconButton(
              icon: const Icon(Icons.done),
              onPressed: () => Navigator.pop(context, true),
              tooltip: 'Mark as done',
            )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.black38,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(70.0),
              child: Image.asset(
                'assets/placeholder_image.png',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Title',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.black54,
                    fontSize: 30.0,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "_loremIpsumParagraph",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.black54,
                    height: 1.5,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}