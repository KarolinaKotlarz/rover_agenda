/// Package imports
import 'package:flutter/material.dart';

/// Local imports
import '../../globals.dart' as globals;

/// The class representing the FAQs page
class FAQs extends StatefulWidget {
  const FAQs({Key? key}) : super(key: key);

  @override
  State<FAQs> createState() => _FAQsState();
}

/// Represents the state class of FAQsState
class _FAQsState extends State<FAQs> {
  /// List of bools that determine which icon to show
  List<bool> _expanded = List<bool>.filled(globals.FAQs.length, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frequently Asked Questions'),
      ),
      body: ListView(
      children: <Widget>[
        /// Loops through the list of FAQs to display each one
        for(int i = 0; i < globals.FAQs.length; i++)
        ExpansionTile(
          title: Text(globals.FAQs[i].question),
          trailing: Icon(
            /// Logic determining which icon to show
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