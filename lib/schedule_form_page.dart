import 'package:flutter/material.dart';
import 'package:rover_agenda/schedule.dart';
import 'globals.dart' as globals;
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'flyout_menu.dart';

class ScheduleFormPage extends StatefulWidget {
  const ScheduleFormPage({Key? key}) : super(key: key);
  static String routeName = "/extracurriculars";

  @override
  State<StatefulWidget> createState() {
    return ScheduleFormState();
  }
}



class ScheduleFormState extends State<ScheduleFormPage> {
  final _formKey = GlobalKey<FormState>();

  Appointment _appointment = new Appointment(
      startTime: DateTime(2022, 1, 16, 10, 38),
      endTime: DateTime(2022, 1, 16, 11, 34),
      recurrenceRule: 'FREQ=DAILY;INTERVAL=2;UNTIL=20220606'
  );

  Widget _buildSubjectField() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Subject',
      ),
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the subject name';
        }
        return null;
      },
      onSaved: (value) {
        _appointment.subject = value!;
      }
    );
  }

  Widget _buildTeacherField() {
    return TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Teacher\'s Name',
        ),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the teacher\'s name';
          }
          return null;
        },
        onSaved: (value) {
          _appointment.subject = value!;
        }
    );
  }

  Widget _buildRoomField() {
    return TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Room #',
        ),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the classroom number';
          }
          return null;
        },
        onSaved: (value) {
          _appointment.subject = value!;
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Classes'),
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
                _buildTeacherField(),
                _buildRoomField(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Class Added')),
                        );

                        _formKey.currentState?.save();
                        globals.appointments.add(_appointment);

                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Schedule()),
                        );
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
          ),
        )
      )
    );
  }
}
