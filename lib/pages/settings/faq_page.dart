/// Package imports
import 'package:flutter/material.dart';

/// Local imports
import '../../globals.dart' as globals;

/// The class representing the FAQs page
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
/// Represents the state class of FAQsState
class _FAQsState extends State<FAQs> {
  /// List of bools that determine which icon to show
  List<bool> _expanded = List<bool>.filled(globals.FAQs.length, false);

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
                  switch (snapshot.connectionState) { // This checks the connection state and updates the UI accordingly.
                    case ConnectionState.none:
                      return Text('None');
                    case ConnectionState.waiting:
                      return Text('Waiting');
                    case ConnectionState.active:
                      return Text('Active');
                    case ConnectionState.done:
                      return  ListView(
                        children: snapshot.data.map<Widget>((faq) { // Maps each FAQ to an expandable tile.
                          return ExpansionTile(
                            title: Text(faq.question),
                            children: <Widget>[
                              Text(faq.answer),
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
