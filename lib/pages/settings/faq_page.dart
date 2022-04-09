import 'package:flutter/material.dart';

import '../../globals.dart' as globals;

class FAQs extends StatefulWidget {
  const FAQs({Key? key}) : super(key: key);

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  bool _customTileExpanded = false;
  List<bool> _expanded = List<bool>.filled(globals.FAQs.length, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frequently Asked Questions'),
      ),
      body: ListView(
      children: <Widget>[
        //for(var faq in globals.FAQs)
        for(int i = 0; i < globals.FAQs.length; i++)
        ExpansionTile(
          title: Text(globals.FAQs[i].question),
          trailing: Icon(
            _expanded[i]
                ? Icons.horizontal_rule_outlined
                : Icons.add,
          ),
          children: <Widget>[
            ListTile(title: Text(globals.FAQs[i].answer), subtitle: const Text('')),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() => _expanded[i] = expanded);
          },
        ),
      ],
    ),
    );
  }
}