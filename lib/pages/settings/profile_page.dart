/// Package imports
import 'package:flutter/material.dart';

/// Local imports
import '../../globals.dart' as globals;

/// The class representing the email form page; requires a teacher
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

/// Represents the state class of EmailFormState
class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  /// The text controllers of the form
  final controllerSubject = TextEditingController();
  final controllerBody = TextEditingController();

  /// Builds the subject form field
  Widget _buildSubjectField() {
    return TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Subject',
        ),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the subject of the email';
          }
          return null;
        },
        controller: controllerSubject,
        onSaved: (value) {
          controllerSubject.text = value!;
        });
  }

  /// Builds the body form field
  Widget _buildBodyField() {
    return TextFormField(
        maxLines: 8,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Body',
          alignLabelWithHint: true,
        ),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the subject of the email';
          }
          return null;
        },
        controller: controllerBody,
        onSaved: (value) {
          controllerBody.text = value!;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Compose Email to '),
        ),
        body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// To: and From: lines
                    Text('To: '),
                    Text('From: You'),
                    /// The form builder methods are called
                    Padding(padding: const EdgeInsets.all(8.0)),
                    _buildSubjectField(),
                    Padding(padding: const EdgeInsets.all(8.0)),
                    _buildBodyField(),
                    Padding(padding: const EdgeInsets.all(8.0)),
                    Row(
                      children: [
                        /// Send and Cancel buttons
                        Align(
                          alignment: Alignment.topLeft,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                /// Calls method that opens the default email app

                              }
                            },
                            child: Row(
                              children: [
                                Icon(Icons.send, size: 15),
                                Text(
                                  ' Send',
                                  textAlign: TextAlign.right,
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(padding: const EdgeInsets.all(8.0)),
                        Align(
                          alignment: Alignment.topRight,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                Icon(Icons.cancel_outlined, size: 15),
                                Text(
                                  ' Cancel',
                                  textAlign: TextAlign.right,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ))
    );
  }
}
