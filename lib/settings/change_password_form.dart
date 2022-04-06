import 'package:flutter/material.dart';

class PasswordFormPage extends StatefulWidget {
  const PasswordFormPage({Key? key}) : super(key: key);
  static String routeName = "/extracurriculars";

  @override
  State<StatefulWidget> createState() {
    return PasswordFormState();
  }
}

class PasswordFormState extends State<PasswordFormPage> {
  final _formKey = GlobalKey<FormState>();
  final controllerOld = TextEditingController();
  final controllerNew = TextEditingController();
  final controllerRetype = TextEditingController();
  String? passwordText;

  Widget _buildOldPasswordField() {
    return TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Old Password',
        ),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your old password';
          }
          return null;
        },
        controller: controllerOld,
        onSaved: (value) {
          controllerOld.text = value!;
        });
  }

  Widget _buildPasswordField() {
    return TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'New Password',
        ),
        // The validator receives the text that the user has entered.
        validator: (value) {
          passwordText = value;
          if (value == null || value.isEmpty) {
            return 'Please enter a new password';
          }
          return null;
        },
        controller: controllerNew,
        onSaved: (value) {
          controllerNew.text = value!;
        });
  }

  Widget _buildRetypeField() {
    return TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Retype New Password',
        ),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please retype your new password';
          } else if (value != passwordText) {
            return 'Passwords do not match';
          }
          return null;
        },
        controller: controllerRetype,
        onSaved: (value) {
          controllerRetype.text = value!;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Change Password'),
        ),
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildOldPasswordField(),
                Padding(padding: const EdgeInsets.all(8.0)),
                _buildPasswordField(),
                Padding(padding: const EdgeInsets.all(8.0)),
                _buildRetypeField(),
                Padding(padding: const EdgeInsets.all(8.0)),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pop(context);
                          }
                        },
                        child: Row(
                          children: [
                            Icon(Icons.check, size: 15),
                            Text(
                              ' Confirm Password',
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
        )));
  }
}
