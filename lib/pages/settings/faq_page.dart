import 'package:flutter/material.dart';

import '../../globals.dart' as globals;

class FAQs extends StatefulWidget {
  const FAQs({Key? key}) : super(key: key);

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frequently Asked Questions'),
      ),
      body: ListView(
      children: <Widget>[
        for(var faq in globals.FAQs)
        ExpansionTile(
          title: Text(faq.question),
          trailing: Icon(
            _customTileExpanded
                ? Icons.horizontal_rule_outlined
                : Icons.add,
          ),
          children: <Widget>[
            ListTile(title: Text(faq.answer), subtitle: const Text('')),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() => _customTileExpanded = expanded);
          },
        ),
      ],
    ),
    );
  }
}