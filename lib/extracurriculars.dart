import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:rover_agenda/schedule.dart';
import 'globals.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'flyout_menu.dart';

class ExtracurricularsPage extends StatefulWidget {
  const ExtracurricularsPage({Key? key}) : super(key: key);
  static String routeName = "/extracurriculars";

  @override
  State<StatefulWidget> createState() {
    return ExtracurricularsState();
  }
}

class ExtracurricularsState extends State<ExtracurricularsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Extracurriculars'),
        ),
        body: Container(
              margin: EdgeInsets.all(24),
              child: ListView(
                children: <Widget>[
                    Container(
                      color: Colors.grey[200],
                      margin: EdgeInsets.only(top: 10.0),
                      child: Row(
                          children:
                          [
                            Expanded(
                              flex: 7,
                              child: Container(
                                //color: Colors.blue,
                                margin: EdgeInsets.only(left: 10.0, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'FBLA',
                                    ),
                                    Text(
                                      'Room J317',
                                    ),
                                    Text(
                                      'Mrs. Klein',
                                    ),
                                  ],
                                ),

                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                margin: EdgeInsets.all(16.0),
                                child: IconButton(
                                  onPressed: () {

                                  },
                                  icon: Icon(Icons.email_outlined, color: Colors.white,),
                                  iconSize: 30,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            OpenContainer<bool>(
                                transitionType: ContainerTransitionType.fade,
                                openBuilder: (BuildContext _, VoidCallback openContainer) {
                                  return const _DetailsPage();
                                },
                                tappable: false,
                                closedShape: const RoundedRectangleBorder(),
                                closedElevation: 0.0,
                                closedBuilder: (BuildContext _, VoidCallback openContainer) {
                                  return ListTile(
                                    leading: Image.asset(
                                      'assets/avatar_logo.png',
                                      width: 40,
                                    ),
                                    onTap: openContainer,
                                    title: Text('List item '),
                                    subtitle: const Text('Secondary text'),
                                  );
                                },
                              ),

                          ]
                      ),
                    ),
                ],
              ),

        )
    );
  }
}


class _DetailsPage extends StatelessWidget {
  const _DetailsPage({this.includeMarkAsDoneButton = true});

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
