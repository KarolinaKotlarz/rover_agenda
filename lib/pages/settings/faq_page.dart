import 'package:flutter/material.dart';

import '../../globals.dart' as globals;

class Todos extends StatefulWidget {
  const Todos({Key? key}) : super(key: key);

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  bool _customTileExpanded = false;
  late Future todosFuture;
@override
void initState() {
  super.initState();
  todosFuture = globals.getTodos();

}
 // List<bool> _expanded = List<bool>.filled(globals.Todos, false);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            child: FutureBuilder(
                future: todosFuture,
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
                            title: Text(todo.title),
                            children: <Widget>[
                              Text(todo.completed.toString()),
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
