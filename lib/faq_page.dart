import 'package:flutter/material.dart';

import 'flyout_menu.dart';
import 'globals.dart' as globals;

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
      body: Column(
      children: <Widget>[
        ExpansionTile(
          title: const Text('ExpansionTile 2'),
          trailing: Icon(
            _customTileExpanded
                ? Icons.horizontal_rule_outlined
                : Icons.add,
          ),
          children: const <Widget>[
            ListTile(title: Text(''), subtitle: Text(globals.loremIpsumParagraph)),

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


// class FAQs extends StatelessWidget {
//
//   bool _customTileExpanded = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Frequently Asked Questions'),
//       ),
//       body: Column(
//       children: <Widget>[
//         Text(text, textAlign: TextAlign.left,)
//
//     //   ExpansionTile(
//     //   title: const Text('ExpansionTile 2'),
//     //   subtitle: const Text('Custom expansion arrow icon'),
//     //   trailing: Icon(
//     //   _customTileExpanded
//     //   ? Icons.arrow_drop_down_circle
//     //       : Icons.arrow_drop_down,
//     //   ),
//     //   children: const <Widget>[
//     // ListTile(title: Text('This is tile number 2')),
//     // ],
//     // onExpansionChanged: (bool expanded) {
//     // setState(() => _customTileExpanded = expanded);
//     // },
//     // ),
//
//     ],
//     ),
//     );
//   }
// }
