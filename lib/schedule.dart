import 'package:flutter/material.dart';
import 'package:rover_agenda/schedule_form.dart';
import 'package:rover_agenda/schedule_form_page.dart';

class Schedule extends StatelessWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ScheduleFormPage()),
            );
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}