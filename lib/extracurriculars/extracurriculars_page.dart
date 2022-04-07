// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:rover_agenda/flyout_menu.dart';
import '../globals.dart';
import 'package:rover_agenda/teachers/email_form_page.dart';


class Extracurriculars extends StatefulWidget {
  const Extracurriculars({Key? key}) : super(key: key);

  @override
  _ExtracurricularsState createState() {
    return _ExtracurricularsState();
  }
}

class _ExtracurricularsState
    extends State<Extracurriculars> {
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extracurriculars'),
      ),
      drawer: NavDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          for(var e in extracurriculars)
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


class _DetailsPage extends StatelessWidget {
  const _DetailsPage({required this.extracurricular});

  final Extracurricular extracurricular;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(extracurricular.name),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.email_outlined),
            onPressed: () {
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
                  extracurricular.name,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.black54,
                    fontSize: 30.0,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
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