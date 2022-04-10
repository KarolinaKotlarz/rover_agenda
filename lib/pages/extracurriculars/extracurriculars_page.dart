// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Package imports
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

/// Local imports
import '../../components/flyout_menu.dart';
import '../../globals.dart';
import '../../pages/teachers/email_form_page.dart';

/// The class representing the extracurriculars page
class Extracurriculars extends StatefulWidget {
  const Extracurriculars({Key? key}) : super(key: key);

  @override
  _ExtracurricularsState createState() {
    return _ExtracurricularsState();
  }
}

/// Represents the state class of ExtracurricularsState
class _ExtracurricularsState
    extends State<Extracurriculars> {
  /// Sets the transition type to be used
  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extracurriculars'),
      ),
      drawer: FlyoutMenu(),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          for(var e in extracurriculars)
          /// Defines the widget that displays each extracurricular
          OpenContainer<bool>(
              transitionType: _transitionType,
              openBuilder: (BuildContext _, VoidCallback openContainer) {
                return _DetailsPage(extracurricular: e);
              },
              tappable: false,
              closedShape: const RoundedRectangleBorder(),
              closedElevation: 0.0,
              closedBuilder: (BuildContext _, VoidCallback openContainer) {
                return ListTile(
                  onTap: openContainer,
                  title: Text(e.name),
                  subtitle: Text('Advisor: ' + e.teacher.firstName + ' ' + e.teacher.lastName),
                );
              },
            ),
        ],
      ),
    );
  }
}

/// The class representing the details page of each extracurricular; takes in an object representing it
class _DetailsPage extends StatelessWidget {
  const _DetailsPage({required this.extracurricular});

  final Extracurricular extracurricular;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(extracurricular.name),
        actions: <Widget>[
          /// The button that opens the page that lets the user compose an email to the advisor of each extracurricular
          IconButton(
            icon: const Icon(Icons.email_outlined),
            onPressed: () {
              /// Opens EmailFormPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmailFormPage(teacher: extracurricular.teacher)),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          /// Decorative section of the details page
          Container(
            color: Colors.black38,
            height: 250,
            child: Image.asset(
                'assets/images/placeholder_image.png',
            ),
          ),
          Padding(
          /// Text section of the details page
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  extracurricular.name,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.black54,
                    fontSize: 30.0,
                  ),
                ),
                const SizedBox(height: 10),
                Text('Advisor: ' +
                    extracurricular.teacher.firstName + ' ' + extracurricular.teacher.lastName,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.black54,
                    height: 1.5,
                    fontSize: 16.0,
                  ),
                ),
                Text('Email: ' +
                    extracurricular.teacher.email,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.black54,
                    height: 1.5,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 10),
                Text('Meeting dates: ' +
                    extracurricular.meetingDays,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.black54,
                    height: 1.5,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 10),
                Text('About: ' +
                  extracurricular.description,
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