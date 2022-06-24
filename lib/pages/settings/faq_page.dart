/// Package imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:core';

/// Local imports
import '../../globals.dart' as globals;
import '../../http_api_client.dart';

/// The class representing the FAQs page
class FAQs extends StatefulWidget {
  const FAQs({Key? key}) : super(key: key);

  @override
  State<FAQs> createState() => _TodosState();
}

class _TodosState extends State<FAQs> {
  bool _customTileExpanded = false;
  late Future<List<globals.FAQ>> futureFAQs;
  late SharedPreferences prefs;

  HttpApiClient _httpApiClientclient = new HttpApiClient();

  @override
  void initState()  {
    super.initState();
    futureFAQs = _httpApiClientclient.fetchFAQs();
  }

  // List<bool> _expanded = List<bool>.filled(globals.Todos, false);
  /// Represents the state class of FAQsStateclass _FAQsState extends State<FAQs> {
  /// List of bools that determine which icon to show

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FAQs'),
        ),
        body: Container(
            child: FutureBuilder<List<globals.FAQ>>(
                future: futureFAQs,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          var faq = snapshot.data![index];
                          return ExpansionTile(
                            title: Text(faq.question),
                            children: <Widget>[
                              Text(faq.answer),
                            ],
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                  /*switch (snapshot.connectionState) {
                // This checks the connection state and updates the UI accordingly.
                case ConnectionState.none:
                  return Text('None');
                case ConnectionState.waiting:
                  return Text('Waiting');
                case ConnectionState.active:
                  return Text('Active');
                case ConnectionState.done:
                  return ListView(
                    children: snapshot.data.map<Widget>((faq) {
                      // Maps each FAQ to an expandable tile.
                      return ExpansionTile(
                        title: Text(faq.question),
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(faq.answer)
                          ),
                        ],
                      );
                    }).toList(),
                  );
                default:
                  return Text('Default');
              }*/
                })));
  }
}
