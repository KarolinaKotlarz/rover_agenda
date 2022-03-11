import 'package:flutter/material.dart';
import 'package:rover_agenda/schedule.dart';
import 'globals.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'flyout_menu.dart';

class EmailFormPage extends StatefulWidget {
  const EmailFormPage({Key? key, required this.teacher}) : super(key: key);
  static String routeName = "/extracurriculars";
  final Teacher teacher;

  @override
  State<StatefulWidget> createState() {
    return EmailFormState();
  }
}



class EmailFormState extends State<EmailFormPage> {
  final _formKey = GlobalKey<FormState>();

  final controllerSubject = TextEditingController();
  final controllerBody = TextEditingController();


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
        }
    );
  }

  Widget _buildBodyField() {
    return TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Body',
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
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Compose Email to ' + widget.teacher.firstName + ' ' + widget.teacher.lastName),
        ),
        body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSubjectField(),
                    _buildBodyField(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {

                            _launchEmail(
                              emailTo: widget.teacher.email,
                              subject: controllerSubject.text,
                              body: controllerBody.text
                            );

                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Send'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                    )
                  ],
                ),
              ),
            )
        )
    );
  }

  Future _launchEmail({
    required emailTo,
    required String subject,
    required String body
  }) async {
    final url = 'mailto:$emailTo?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';
    await launch(url);
  }
}
