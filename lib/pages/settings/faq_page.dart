import 'package:flutter/material.dart';

import '../../globals.dart' as globals;

class FAQs extends StatefulWidget {
  const FAQs({Key? key}) : super(key: key);

  @override
  State<FAQs> createState() => _TodosState();
}

class _TodosState extends State<FAQs> {
  bool _customTileExpanded = false;
  late Future FAQsFuture;
@override
void initState() {
  super.initState();
  FAQsFuture = globals.FAQs;

}
 // List<bool> _expanded = List<bool>.filled(globals.Todos, false);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            child: FutureBuilder(
                future: FAQsFuture,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text('None');
                    case ConnectionState.waiting:
                      return Text('Waiting');
                    case ConnectionState.active:
                      return Text('Active');
                    case ConnectionState.done:
                      return  ListView(
                        children: snapshot.data.map<Widget>((todo) {
                          return ExpansionTile(
                            title: Text(todo.question),
                            children: <Widget>[
                              Text(todo.answer),
                            ],
                          );
                        }).toList(),
                      );
                    default:
                      return Text('Default');
                  }
                })));
  }
}
