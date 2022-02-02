import 'package:flutter/material.dart';

// Define a custom Form widget.
class ScheduleForm extends StatefulWidget {
  const ScheduleForm({Key? key}) : super(key: key);

  @override
  ScheduleFormState createState() {
    return ScheduleFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class ScheduleFormState extends State<ScheduleForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBlockFormFields(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Submitted')),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text('Submit'),
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
    );
  }
}

Widget _buildBlockFormFields() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
              return 'Please enter the subject name';
              }
            return null;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Subject',
            ),
          )
        ),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the subject name';
              }
              return null;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Teacher Name',
            ),
          )
      ),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the subject name';
              }
              return null;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Room #',
            ),
          )
      )
    ]
  );
}