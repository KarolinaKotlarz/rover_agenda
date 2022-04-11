/// Package imports
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Local imports
import '../../globals.dart' as globals;

/// The class representing the email form page; requires a teacher
class EmailFormPage extends StatefulWidget {
  const EmailFormPage({Key? key, required this.teacher}) : super(key: key);

  final globals.Teacher teacher;

  @override
  State<StatefulWidget> createState() {
    return _EmailFormState();
  }
}

/// Represents the state class of EmailFormState
class _EmailFormState extends State<EmailFormPage> {
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
        title: Text('Compose Email to ' +
            widget.teacher.firstName +
            ' ' +
            widget.teacher.lastName),
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
              Text('To: ' + widget.teacher.email),
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
                          _launchEmail(
                              emailTo: widget.teacher.email,
                              subject: controllerSubject.text,
                              body: controllerBody.text);
                          Navigator.pop(context);
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

  /// Opens the default email app and passes the composed email to it
  Future _launchEmail(
      {required emailTo, required String subject, required String body}) async {
    final url =
        'mailto:$emailTo?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';
    await launch(url);
  }
}
